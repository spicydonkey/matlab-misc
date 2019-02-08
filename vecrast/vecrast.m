function vecrast(figureHandle, filename, resolution, stack, exportType)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Original: 
% Theodoros Michelis, 6 October 2017
% TUDelft, Aerospace Engineering, Aerodynamics
% t.michelis@tudelft.nl
%
% Minor edits:
% David Shin
% dk.shin1992@gmail.com
%
% D E S C R I P T I O N:
% vecrast is a function that allows to automatically save a figure with
% mixed vector and raster content. More specifically, two copies of the
% figure of interest are created, rasterFigure and vectorFigure. Patches,
% surfaces, contours, images, and lights are kept in rasterFigure but
% removed from vectorFigure. rasterFigure is then saved as a temporary
% .png image with the required resolution. The .png file is subsequently
% inserted into the vectorFigure, and the result is saved in a single
% vector file.
%
%
% I N P U T:
% vecrast(figureHandle, filename, resolution, stack, exportType)
%   figureHandle:   Handle of the figure of interest
%   filename:       Baseline name string of output file WITHOUT the extension.
%   resolution:     Desired resolution of rasterising in dpi
%   stack:          'top' or 'bottom'. Stacking of raster image with
%                       respect to axis in vector figure, see examples below.
%   exportType:     'pdf'/'eps'/'svg'. Export file type for the output file.
%
%
% N O T E S:
% - The graphics smoothing (anti-aliasing) is turned off for the raster
%   figure. This improves sharpness at the borders of the image and at the
%   same time greatly reduces file size. You may change this option in the
%   script by setting 'GraphicsSmoothing', 'on' (line 84).
% - A resolution of no less than 300 dpi is advised. This ensures that
%   interpolation at the edges of the raster image does not cause the image
%   to bleed outside the prescribed axis (make a test with 20dpi on the
%   first example and you will see what I mean).
% - The stacking option has been introduced to accomodate 2D and 3D plots
%   which require the image behind or in front the axis, respectively. This
%   difference can be seen in the examples below.
% - I strongly advise to take a look at the tightPlots function that allows
%   setting exact sizes of figures.

% E X A M P L E   1:
%   clear all; close all; clc;
%   Z = peaks(20);
%   contourf(Z,10)
%   vecrast(gcf, 'example1', 300, 'bottom', 'pdf');

% E X A M P L E   2:
%   clear all; close all; clc;
%   [X,Y] = meshgrid(1:0.4:10, 1:0.4:20);
%   Z = sin(X) + cos(Y);
%   surf(X,Y,Z)
%   vecrast(gcf, 'example2', 300, 'top', 'pdf');

% Thanks to Jonathan Kohler, Kerry and Bob DA for their input.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Some checks of the input ------------------------------------------------
if strcmp(stack, 'top') + strcmp(stack, 'bottom') == 0
    error('Stack must be ''top'' or ''bottom''');
end
if strcmp(exportType, 'pdf') + strcmp(exportType, 'eps') + strcmp(exportType, 'svg') == 0
    error('Stack must be ''pdf'' or ''eps''');
end

% Ensure figure has finished drawing
drawnow;

% Set figure units to points
set(figureHandle, 'units', 'points');

% Ensure figure size and paper size are the same
figurePosition = get(figureHandle, 'Position');
set(figureHandle, 'PaperUnits', 'points', 'PaperSize', [figurePosition(3) figurePosition(4)])
set(figureHandle, 'PaperPositionMode', 'manual', 'PaperPosition', [0 0 figurePosition(3) figurePosition(4)]);

% Create a copy of the figure and remove smoothness in raster figure
rasterFigure = copyobj(figureHandle, groot);
vectorFigure = copyobj(figureHandle, groot);
% set(rasterFigure, 'GraphicsSmoothing', 'off', 'color', 'none');   % BUG1: black gridlines over raster (e.g. SURF)
set(rasterFigure, 'GraphicsSmoothing', 'on', 'color', 'w');     % DEBUG for BUG1
set(vectorFigure, 'GraphicsSmoothing', 'off', 'color', 'w');


% Fix vector image axis limits based on the original figure
% (this step is necessary if these limits have not been defined)
axesHandle = findall(vectorFigure, 'type', 'axes');
for i = 1:length(axesHandle)
    xlim(axesHandle(i), 'manual');
    ylim(axesHandle(i), 'manual');
    zlim(axesHandle(i), 'manual');
end

% Create axis in vector figure to fill with raster image
rasterAxis = axes(vectorFigure, 'color', 'none', 'box', 'off', 'units', 'points');
set(rasterAxis, 'position', [0 0 figurePosition(3) figurePosition(4)]);
uistack(rasterAxis, stack);

% Ensure fontsizes are the same in all figures
figText = findall(figureHandle, 'type', 'text');
rastText = findall(rasterFigure, 'type', 'text');
vecText = findall(vectorFigure, 'type', 'text');
for i=1:length(figText)
    set(rastText(i), 'FontSize', get(figText(i), 'FontSize'));
    set(vecText(i), 'FontSize', get(figText(i), 'FontSize'));
end

% Raster Figure ----------------------------------------------------------
% Select what to remove from raster figure
axesHandle = findall(rasterFigure, 'type', 'axes');
axesPosition = get(axesHandle,'position'); % Fix: get axes size
set(axesHandle, 'color', 'none');
for i = 1:length(axesHandle)
    contents = findall(axesHandle(i));
    toKeep = [...
        findall(axesHandle(i), 'type', 'patch');...
        findall(axesHandle(i), 'type', 'surface');...
        findall(axesHandle(i), 'type', 'contour')...
        findall(axesHandle(i), 'type', 'image');...
        findall(axesHandle(i), 'type', 'light')];
    toRemove = setxor(contents, toKeep);
    set(toRemove, 'visible', 'off');
end

% set(axesHandle,'position',axesPosition); % Fix: restore original axes size
if numel(axesHandle)==1
    set(axesHandle,'position',axesPosition); % Fix: restore original axes size
else
    for i=1:numel(axesHandle)
        set(axesHandle(i),'position',axesPosition{i}); % Fix: restore original axes size
    end
end


% Remove all annotations from raster figure
annotations = findall(rasterFigure, 'Tag', 'scribeOverlay');
for i = 1:length(annotations)
    set(annotations(i), 'visible', 'off');
end

% Hide all colorbars and legends from raster figure
colorbarHandle = findall(rasterFigure, 'type', 'colorbar');
%hcbOriginal = findall(figureHandle, 'type', 'colorbar');		% DKS debugging colorbar problems
legendHandle = findall(rasterFigure, 'type', 'legend');
set([colorbarHandle; legendHandle], 'visible', 'off');

% Print rasterFigure on temporary .png
% ('-loose' ensures that the bounding box of the figure is not cropped)
print(rasterFigure, [filename 'Temp.png'], '-dpng', ['-r' num2str(resolution) ], '-loose', '-opengl');
close(rasterFigure);

% Vector Figure -----------------------------------------------------------
% Select what to keep in vector figure
axesHandle = findall(vectorFigure, 'type', 'axes');
set(axesHandle, 'color', 'none');
for i = 1:length(axesHandle)
    toRemove = [...
        findall(axesHandle(i), 'type', 'patch');...
        findall(axesHandle(i), 'type', 'surface');...
        findall(axesHandle(i), 'type', 'contour');...
        findall(axesHandle(i), 'type', 'image');...
        findall(axesHandle(i), 'type', 'light');...
        ];
    set(toRemove, 'visible', 'off');
end

% Insert Raster image into the vector figure
[A, ~, alpha] = imread([filename 'Temp.png']);

if isempty(alpha)==1
    imagesc(rasterAxis, A);
else
    imagesc(rasterAxis, A, 'alphaData', alpha);
end
axis(rasterAxis, 'off');

% Ensure that all colorbar ticks match the original figure
hcbOriginal = findall(figureHandle, 'type', 'colorbar');
hcbVector = findall(vectorFigure, 'type', 'colorbar');

if ~isempty(hcbOriginal)
    cbLimits = hcbOriginal.Limits;
    hcbVector.Ticks = (hcbOriginal.Ticks - cbLimits(1))/diff(cbLimits);
%     hcbVector.Ticks = hcbOriginal.Ticks;        % DKS: seen this line work when the above line fails
    hcbVector.TickLabels = hcbOriginal.TickLabels;
end
% for i=1:numel(hcbOriginal)
%     cbLimits = hcbOriginal(i).Limits;
%     hcbVector(i).Ticks = (hcbOriginal(i).Ticks - cbLimits(1))/diff(cbLimits);
%     hcbVector(i).TickLabels = hcbOriginal(i).TickLabels;
% end

% Bring all annotations on top
annotations = findall(vectorFigure, 'Tag', 'scribeOverlay');
for i = 1:length(annotations)
    uistack(annotations(i), 'top');
end
% Ensure figure has finished drawing
drawnow;

% Finalise ----------------------------------------------------------------
% Remove raster image from directory
delete([filename 'Temp.png']); % COMMENT THIS IF YOU WANT TO KEEP PNG FILE

% Print and close the combined vector-raster figure
% set(vectorFigure, 'Renderer', 'painters');
if strcmp(exportType, 'pdf') == 1
    print(vectorFigure, [filename '.pdf'], '-dpdf', '-loose', '-painters', ['-r' num2str(resolution) ]);
elseif strcmp(exportType, 'eps') == 1
    print(vectorFigure, [filename '.eps'], '-depsc2', '-loose', '-painters');
elseif strcmp(exportType, 'svg') == 1
    print(vectorFigure, [filename '.svg'], '-dsvg', '-loose', '-painters');
end

close(vectorFigure);

end