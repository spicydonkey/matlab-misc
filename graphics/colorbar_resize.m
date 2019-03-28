function colorbar_resize(cbar,ax,cbar_pos)
%colorbar_resize - resizes colorbar without affecting original axes
ax_pos0=get(ax,'Position');
set(cbar,'Position',cbar_pos);
set(ax,'Position',ax_pos0);
end