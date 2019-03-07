function print_pnghr(figureHandle)
%pring_pnghr - a simple wrapper for high resolution png printing

filename=strcat(figureHandle.Name,'_',getdatetimestr);
print(figureHandle,strcat(filename,'.png'),'-dpng','-r600');

end
