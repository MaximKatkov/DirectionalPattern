if ~isdeployed
    fprintf('%s startup script %s\n', ...
        repmat('*', [1 22]), repmat('*', [1 23]));
    workDir = pwd;
    toBeAddedDirs = {'Run', 'Core', 'Process', 'test', 'data'};
                 
                 
    for i1 = 1 : numel(toBeAddedDirs)
        addpath([workDir filesep toBeAddedDirs{i1}]);
        fprintf('Directory added: %s\n', toBeAddedDirs{i1});
    end
    clear workDir toBeAddedDirs i1
    fprintf('%s\n', repmat('*', [1 80]));
end
