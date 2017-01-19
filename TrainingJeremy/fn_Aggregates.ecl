
IMPORT $;
EXPORT fn_Aggregates(DATASET(RECORDOF($.Persons)) DS, INTEGER FieldName) := FUNCTION

noDep := COUNT(DS(FieldName =0));
totDep := SUM(DS,FieldName);
avgDep := AVE(DS, FieldName);
minDep := MIN(DS, FieldName);
maxDep := MAX(DS, FieldName);
result := DATASET([{'No Dependents', noDep},{'Total Dependents',totDep},{'Average Dependents',avgDep},
{'Max Dependents',maxDep},{'Min Dependents',minDep}],{String19 valuetype, Integer val});
return result;

END;