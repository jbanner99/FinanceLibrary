xtab := Record
$.File_Persons.File.Gender;
GrpCount:= COUNT(GROUP);
end;

MYTABLE:= TABLE($.File_Persons.File,xtab,Gender);
Export XTAB_Persons_Gender := MYTABLE;