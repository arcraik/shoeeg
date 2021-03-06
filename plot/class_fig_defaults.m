classdef class_fig_defaults
    % for setting default settings of your own for figure plotting
    %   Usage:
    %       % Just to load the settings, use this
    %       fig_defaults_obj = class_fig_defaults();
    %       process(fig_defaults_obj);
    %
    %       % If you want to modify something, do so.
    %       fig_defaults_obj =
    %       class_fig_defautls('minortick','on','gridlines','on');
    %       process(fig_defaults_obj);
    %
    %       % If you want to reset to the normal settings
    %       restore(fig_defaults_obj);
    %   
    %   Reference:
    %       https://www.mathworks.com/help/matlab/creating_plots/default-property-values.html
    %       
    %       If you want to add more, simply type "get(groot, 'Factory')" to
    %       see all the available options.
    
    % Copyright (C) 2017 Sho Nakagome (snakagome@uh.edu)
    %
    %     This program is free software: you can redistribute it and/or modify
    %     it under the terms of the GNU General Public License as published by
    %     the Free Software Foundation, either version 3 of the License, or
    %     (at your option) any later version.
    %
    %     This program is distributed in the hope that it will be useful,
    %     but WITHOUT ANY WARRANTY; without even the implied warranty of
    %     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %     GNU General Public License for more details.
    %
    %     You should have received a copy of the GNU General Public License
    %     along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    properties
        minortick;
        gridlines;
        fontname;
    end
    
    methods (Access = public)
        % defining a constructor
        function obj = class_fig_defaults(varargin)
            % parameters to change
            obj.minortick = get_varargin(varargin,'minortick','off');
            obj.gridlines = get_varargin(varargin,'gridlines','off');
            obj.fontname = get_varargin(varargin,'fontname','Arial');
        end
    end
    
    methods
        % process to change the settings
        function process(obj)
            % change the default parameters
            set(groot, ...
                ... % Text related
                'DefaultTextFontName', obj.fontname, ...
                'DefaultTextVerticalAlignment', 'middle', ...
                'DefaultTextHorizontalAlignment', 'left', ...
                ...
                ... % Axis related
                'DefaultLineLineWidth', 1, ...
                'DefaultAxesFontName', obj.fontname, ...
                'DefaultAxesLineWidth', 1.5, ...
                'DefaultAxesFontSize', 10, ...
                'DefaultAxesBox', 'off', ...
                'DefaultAxesColor', 'w', ...
                'DefaultAxesLayer', 'Bottom', ...
                'DefaultAxesNextPlot', 'replace', ...
                'DefaultAxesTickDir', 'out', ...
                'DefaultAxesTickLength', [.02 .02], ...
                ...
                ... % Other figure related
                'DefaultFigureColor', 'w', ...
                'DefaultFigureInvertHardcopy', 'off', ...
                'DefaultFigurePaperUnits', 'inches', ...
                'DefaultFigureUnits', 'inches', ...
                'DefaultFigurePaperPosition', [0, 0, 3.5, 3.5/1.618], ...
                'DefaultFigurePaperSize', [3.5, 3.5/1.618], ...
                'DefaultFigurePosition', [2, 5, 3.5, 3.5/1.618]);
            
            % for putting minor ticks
            if strcmpi(obj.minortick,'on') == 1
                set(groot,...
                    'DefaultAxesXMinorTick', 'on', ...
                    'DefaultAxesYMinorTick', 'on', ...
                    'DefaultAxesZMinorTick', 'on');
            end
            
            % for putting grid lines
            if strcmpi(obj.gridlines,'on') == 1
                set(groot,...
                    'DefaultAxesXGrid', 'on', ...
                    'DefaultAxesYGrid', 'on', ...
                    'DefaultAxesZGrid', 'on');
            end
        end
        
        % restore to factory default settings
        function restore(obj)
            % reset to default options
            % if you know the better and safe way, please let me know
            set(groot, ...
                ... % Text related
                'DefaultTextFontName', 'Helevetica', ...
                'DefaultTextVerticalAlignment', 'middle', ...
                'DefaultTextHorizontalAlignment', 'left', ...
                ...
                ... % Axis related
                'DefaultLineLineWidth', 0.5, ...
                'DefaultAxesFontName', 'Helevetica', ...
                'DefaultAxesLineWidth', 0.5, ...
                'DefaultAxesFontSize', 10, ...
                'DefaultAxesBox', 'off', ...
                'DefaultAxesColor', [1,1,1], ...
                'DefaultAxesLayer', 'Bottom', ...
                'DefaultAxesNextPlot', 'replace', ...
                'DefaultAxesTickDir', 'in', ...
                'DefaultAxesTickLength', [.01 .025], ...
                ...
                ... % Other figure related
                'DefaultFigureColor', [0.94,0.94,0.94], ...
                'DefaultFigureInvertHardcopy', 'on', ...
                'DefaultFigurePaperUnits', 'inches', ...
                'DefaultFigureUnits', 'pixels', ...
                'DefaultFigurePaperPosition', [0.25,0.25,8,6], ...
                'DefaultFigurePaperSize', [8.5,11], ...
                'DefaultFigurePosition', [200,200,600,500]);
        end
    end
    
    methods (Access = private)
        % defining a destructor
        function delete(obj)
            % Delete object
        end
    end
    
end

