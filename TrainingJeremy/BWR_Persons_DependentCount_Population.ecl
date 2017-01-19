myRecord := RECORD
STRING15 valuetype;
INTEGER8 val;
end;

c1 := COUNT($.File_Persons.File(DependentCount=0));
c2 := COUNT($.File_Persons.File);
c3 := (Integer)(((c2-c1)/c2)*100);
myTable := DATASET([{'Total Records', c2},{'Recs=0',c1},{'Population Pct',c3}],myRecord);
OUTPUT(myTable);