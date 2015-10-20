function [ srcImages ] = msc_getImages ( srcFolder, fileMask )

% функция возвращает массив ячеек, в каждой из которых содержится
% одно исходное изображение
 
% Входные параметры:
%	scrFolder - имя папки с исходными изображениями
%   fileMask  - строка, определяющая максу файлов, которые будут загружены
%               по умолчанию значение равно '*.jpg'                

% Выходные параметры 
%   srcImages - массив ячеек с исходными изображениями:
%				каждое изображение имеет тип double и 
%				диапазон значений [0..1]

    if ~exist('fileMask', 'var')
        mask = '*.jpg';
    else
        mask = fileMask;
    end

	curFolder = pwd;

	srcFileList = fullfile(srcFolder, mask);
	srcFileList = dir(srcFileList);
	cd(srcFolder);

	for i = 1:length(srcFileList)
		srcImages{i} = double(imread(srcFileList(i).name))/255;      
	end
	cd(curFolder);
end