
function compileMexGLCD()
    % Compile the GLCD MEX binary
    
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
    
    cppSource = '../../../C++/Library/';
    
    sources = { 'MexGLCD.cpp', ...
                [cppSource 'Quadrature/Workspace.cpp'], ...
                [cppSource 'Quadrature/GaussKronrod.cpp'], ...
                [cppSource 'Quadrature/QAG.cpp'], ...
                [cppSource 'Optimization/LineSearchNocedal.cpp'], ...
                [cppSource 'Optimization/QuasiNewton.cpp'], ...
                [cppSource 'Optimization/LBFGS.cpp'], ...
                [cppSource 'GLCD/MCvMDistance.cpp'], ...
                [cppSource 'GLCD/MCvMDistanceAsym.cpp'], ...
                [cppSource 'GLCD/MCvMDistanceSym.cpp'], ...
                [cppSource 'GLCD/MCvMDistanceSymEven.cpp'], ...
                [cppSource 'GLCD/MCvMDistanceSymOdd.cpp'], ...
                [cppSource 'GLCD/MCvMDistanceOptimizer.cpp'], ...
                [cppSource 'GLCD/Misc.cpp'], ...
                [cppSource 'GLCD/ExpInt.cpp'], ...
                [cppSource 'GLCD/Computation.cpp'] };
    
    inclueDirs = { ['-I' cppSource] };
    
    compileMexOpenMP('-output', 'GLCD', inclueDirs{:}, sources{:});
end
