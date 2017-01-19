IMPORT $;
OlderPersons := $.Persons.BirthDate[..4]<'1980';
c1 := COUNT($.MenInMStates(OlderPersons));
c2 := COUNT($.Persons(Gender='M',OlderPersons));
PercOlderMalesinMStates := (DECIMAL5_2)(c1/c2 * 100);

FemalesInMStates := $.Persons(OlderPersons, State IN $.SetMStates, Gender='F');
FemalesInAllStates := $.Persons(OlderPersons, Gender='F');
c3:= COUNT(FemalesInMStates);
c4 := COUNT(FemalesInAllStates);
PercOlderFemailsinMStates := (DECIMAL5_2)(c3/c4 * 100);

OUTPUT(PercOlderMalesinMStates);

OUTPUT(PercOlderFemailsinMStates);




