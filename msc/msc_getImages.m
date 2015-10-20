function [ srcImages ] = msc_getImages ( srcFolder, fileMask )

% ������� ���������� ������ �����, � ������ �� ������� ����������
% ���� �������� �����������
 
% ������� ���������:
%	scrFolder - ��� ����� � ��������� �������������
%   fileMask  - ������, ������������ ����� ������, ������� ����� ���������
%               �� ��������� �������� ����� '*.jpg'                

% �������� ��������� 
%   srcImages - ������ ����� � ��������� �������������:
%				������ ����������� ����� ��� double � 
%				�������� �������� [0..1]

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