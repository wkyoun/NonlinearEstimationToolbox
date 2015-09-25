
function compileMex(varargin)
    % Compile a MEX binary
    
    % >> This function/class is part of the Nonlinear Estimation Toolbox
    %
    %    For more information, see https://bitbucket.org/nonlinearestimation/toolbox
    %
    %    Copyright (C) 2015  Jannik Steinbring <jannik.steinbring@kit.edu>
    %
    %                        Institute for Anthropomatics and Robotics
    %                        Chair for Intelligent Sensor-Actuator-Systems (ISAS)
    %                        Karlsruhe Institute of Technology (KIT), Germany
    %
    %                        http://isas.uka.de
    %
    %    This program is free software: you can redistribute it and/or modify
    %    it under the terms of the GNU General Public License as published by
    %    the Free Software Foundation, either version 3 of the License, or
    %    (at your option) any later version.
    %
    %    This program is distributed in the hope that it will be useful,
    %    but WITHOUT ANY WARRANTY; without even the implied warranty of
    %    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %    GNU General Public License for more details.
    %
    %    You should have received a copy of the GNU General Public License
    %    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    if isunix()
        % Linux specific compiler flags
        cxxFlags = '-std=c++11 -Wall -Wfatal-errors';
        ldFlags  = '';
        
        options  = { ['CXXFLAGS=$CXXFLAGS ' cxxFlags], ...
                     ['LDFLAGS=$LDFLAGS ' ldFlags] };
    else
        options  = {  };
    end
    
    % Enable the MATLAB large-array-handling API
    options{end + 1} = '-largeArrayDims';
    
    % Add include directory for MEX and Eigen stuff
    includeDir = [fileparts(mfilename('fullpath')) '/Include'];
    includes   = { ['-I' includeDir] };
    
    % Call MEX compiler
    mex(options{:}, includes{:}, varargin{:});
end
