IMPORT $;
Boolean IsFloridian:= $.Persons.State = 'FL';
Boolean IsMale:= $.Persons.Gender = 'M';
Boolean IsBorn80:= $.Persons.BirthDate[..4]>='1980';
EXPORT IsYoungFloridaMale := $.Persons(IsFloridian,IsMale,IsBorn80);