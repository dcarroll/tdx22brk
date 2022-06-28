@!/bin/bash

sfdx force:source:beta:status -u xorg
sfdx force:source:beta:pull -u xorg
sfdx force:source:beta:status -u xorg