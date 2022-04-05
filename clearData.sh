#!/bin/bash

sfdx force:apex:execute -f deleteAccount.apex -u tdxscratch-2
sfdx force:apex:execute -f deleteContact.apex -u tdxscratch-2
sfdx force:apex:execute -f deleteBankProduct.apex -u tdxscratch-2
sfdx force:apex:execute -f deleteBankAccount.apex -u tdxscratch-2