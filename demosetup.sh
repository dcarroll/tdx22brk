#!/bin/bash

echo What org should I use?
read orgName

echo Creating $orgName...
sfdx force:org:beta:create -f config/project-scratch-def.json -a $orgName -d 1
echo Pushing source to new $orgName
sfdx force:source:beta:push -u $orgName
echo Assigning permset TDX_Demo for $orgName...
sfdx force:user:permset:assign -n TDX_Demo -u $orgName
echo Importing data to $orgName...
sfdx djc:import -u $orgName

echo The next step is to enable Prediction Builder, press return to open the org
read tossit

sfdx force:org:open -u $orgName

echo After you have configured the org, come back and hit return to finish the TDX_Demo
read tossit 

sfdx force:source:beta:status -u $orgName
sfdx force:source:beta:pull -u $orgName
sfdx force:source:beta:status -u $orgName
