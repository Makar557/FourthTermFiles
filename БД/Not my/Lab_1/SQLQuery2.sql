SELECT	������.������������_������, ������.����_�������
FROM	��������� INNER JOIN
        ������ ON ���������.������������_����� = ������.�������� INNER JOIN
        ������ ON ������.������������_������ = ������.������������
WHERE   (������.����_������� > 1.0 AND ������.����_������� < 1.50)
