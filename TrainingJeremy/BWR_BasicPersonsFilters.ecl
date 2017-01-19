#option('SaveCPPTempFiles',true);
// EXPORT BWR_BasicPersonsFilters := 'todo';
IMPORT $;
$.Persons;
// COUNT($.Persons(State='FL',City='MIAMI'));
// COUNT($.Persons(ZipCode='33102'));
// COUNT($.Persons(FirstName[1] = 'B'));
// COUNT($.Persons(FileDate[..4]> '2000'));