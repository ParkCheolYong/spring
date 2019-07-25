use xe;
DROP TABLE day02;
CREATE TABLE day02 (
	num INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(8) NULL,
	sub VARCHAR(20) NULL DEFAULT '�������',
	content TEXT NULL,
	nalja DATETIME NULL,
	PRIMARY KEY (`num`)
)
COLLATE='utf8_general_ci';

-- dummy
insert into day02(name,sub,content,nalja) value ('�׽���','����1','����1',now());
insert into day02(name,sub,content,nalja) value ('�׽���','����2','����3',now());
insert into day02(name,sub,content,nalja) value ('�׽���','����3','����4',now());
insert into day02(name,sub,content,nalja) value ('�׽���','����4','����5',now());
commit;
select * from day02;