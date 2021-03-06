# PALSconstants.R
#
# Gab Abramowitz, UNSW, 2010 (palshelp at gmail dot com)
#
zeroC = 273.15
SprdMissingVal=-9999 # missing value in spreadsheet
NcMissingVal=-9999 # missing value in created netcdf files
CurrentTemplateVersion = '1.0.2'
KnownTemplateVersions = c('1.0.1','1.0.2')
#
getPlotColours = function() {
	plotcolours=c('black','blue2','indianred3','gold2','yellowgreen')
}
# Variable order in spreadsheet template versions:
templateCols = function(templateVersion = CurrentTemplateVersion){
	if(templateVersion=='1.0.1'){
		columnnames=c('LocDate','LocHoD','SWdown',
		'SWdownFlag','LWdown','LWdownFlag','Tair','TairFlag','Qair',
		'QairFlag','Wind','WindFlag','Rainf','RainfFlag','Snowf',
		'SnowfFlag','PSurf','PSurfFlag','CO2air','CO2airFlag','Rnet',
		'RnetFlag','SWup','SWupFlag','Qle','QleFlag','Qh',
		'QhFlag','NEE','NEEFlag','Qg','QgFlag')
		cclasses = c('character','numeric','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer')
	}else if(templateVersion=='1.0.2'){
		columnnames=c('LocDate','LocHoD','SWdown',
		'SWdownFlag','LWdown','LWdownFlag','Tair','TairFlag','Qair',
		'QairFlag','Wind','WindFlag','Rainf','RainfFlag','Snowf',
		'SnowfFlag','PSurf','PSurfFlag','CO2air','CO2airFlag','Rnet',
		'RnetFlag','SWup','SWupFlag','Qle','QleFlag','Qh',
		'QhFlag','NEE','NEEFlag','GPP','GPPFlag','Qg','QgFlag')
		cclasses = c('character','numeric','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer','numeric',
		'integer','numeric','integer','numeric','integer','numeric','integer')
	}else{
		CheckError('S3: Unknown template version [function: templateCols]')
	}
	tcols = list(names=columnnames,classes=cclasses)
	return(tcols)
}
# Gets index of a template variable 
varIndex = function(varname,templateVersion){
	tcols = templateCols(templateVersion)
	idx = 0
	for(v in 1:length(tcols$names)){
		if(varname == tcols$names[v]){
			idx = v	
		}
	}
	return(idx)	
}

# Acceptable variable ranges
GetVariableRanges = function(){
	SWdown = c(0,1360) # surface incident shortwave rad [W/m^2]
	LWdown = c(0,750)  # surface incident longwave rad [W/m^2]
	Tair = c(200,333)  # near surface air temperature [K]
	Qair = c(0,0.1)   # near surface specific humidity [kg/kg]
	Rainf = c(0,0.05)  # rainfall rate [mm/s]
	Snowf = c(0,0.03)  # snowfall rate [mm/s]
	PSurf = c(50000,110000) # surface air pressure [Pa]
	CO2air = c(160,2000) # near surface CO2 concentration [ppmv]
	Wind = c(0,75)     # scalar windspeed [m/s]
	Qle = c(-1000,1000) # latent heat flux [W/m^2]
	Qh = c(-1000,1000) # sensible heat flux [W/m^2]
	Qg = c(-1000,1000) # ground heat flux [W/m^2]
	NEE = c(-100,100)    # met ecosystem exchange CO2 [umol/m^2/s]
	GPP = c(-100,100)    # met ecosystem exchange CO2 [umol/m^2/s]
	SWup = c(0,1350)   # reflected SW rad [W/m^2]
	Rnet = c(-500,1250)# net absorbed radiation [W/m^2]
	range = list(SWdown=SWdown,LWdown=LWdown,Tair=Tair,
		Qair=Qair,Rainf=Rainf,Snowf=Snowf,PSurf=PSurf,
		CO2air=CO2air,Wind=Wind,Qle=Qle,Qh=Qh,NEE=NEE,
		Rnet=Rnet)
	return(range)	
}

# This is a list of alternative names, units and 
# units conversions for variables of interest.
SWdownNames = c('SWdown')
QhNames = c('Qh','FSH') # FSH->CLM
QleNames = c('Qle','FCEV') # NB: FCEV is only PART of Qle for CLM
NEENames = c('NEE','FCO2') # FCO2->CLM
GPPNames = c('GPP')
RnetNames = c('Rnet')
SWnetNames = c('SWnet')
LWnetNames = c('LWnet')
SoilMoistNames = c('SoilMoist')
QgNames = c('Qg')
# First listed units are default; conversions are relative to
# order of listed units to convert to first units type.
# Downward shortwave radiation:
SWdownUnitsName = c('W/m2','W/m^2','Wm^{-2}','wm2','watt/m^2')
SWdownMultiplier = c(1,1,1,1,1)
SWdownAddition = c(0,0,0,0,0)
SWdownUnits = list(name=SWdownUnitsName,multiplier=SWdownMultiplier,
	addition=SWdownAddition)
# Sensible heat:
QhUnitsName = c('W/m2','W/m^2','Wm^{-2}','wm2','watt/m^2')
QhMultiplier = c(1,1,1,1,1)
QhAddition = c(0,0,0,0,0)
QhUnits = list(name=QhUnitsName,multiplier=QhMultiplier,
	addition=QhAddition)
# Latent heat:
QleUnitsName = c('W/m2','W/m^2','Wm^{-2}','wm2','watt/m^2')
QleMultiplier = c(1,1,1,1,1)
QleAddition = c(0,0,0,0,0)
QleUnits = list(name=QleUnitsName,multiplier=QleMultiplier,
	addition=QleAddition)
# Net Ecosystem Exchange of CO2:
NEEUnitsName = c('umol/m2/s','mumol/m2/s','umol/m^2/s',
	'umol/m2s','gC/m^2/s','gC/m2/s')
NEEMultiplier = c(1,1,1,1,1/(1.201E-5),1/(1.201E-5))
NEEAddition = c(0,0,0,0,0,0)
NEEUnits = list(name=NEEUnitsName,multiplier=NEEMultiplier,
	addition=NEEAddition)
# Gross Primary Productivity of CO2:
GPPUnitsName = c('umol/m2/s','mumol/m2/s','umol/m^2/s',
	'umol/m2s','gC/m^2/s','gC/m2/s')
GPPMultiplier = c(1,1,1,1,1/(1.201E-5),1/(1.201E-5))
GPPAddition = c(0,0,0,0,0,0)
GPPUnits = list(name=GPPUnitsName,multiplier=GPPMultiplier,
	addition=GPPAddition)
# Net absorbed radiation:
RnetUnitsName = c('W/m2','W/m^2','Wm^{-2}','wm2','watt/m^2')
RnetMultiplier = c(1,1,1,1,1)
RnetAddition = c(0,0,0,0,0)
RnetUnits = list(name=RnetUnitsName,multiplier=RnetMultiplier,
	addition=RnetAddition)
# Net absorbed shortwave radiation:
SWnetUnitsName = c('W/m2','W/m^2','Wm^{-2}','wm2','watt/m^2')
SWnetMultiplier = c(1,1,1,1,1)
SWnetAddition = c(0,0,0,0,0)
SWnetUnits = list(name=SWnetUnitsName,multiplier=SWnetMultiplier,
	addition=SWnetAddition)
# Net absorbed longwave radiation:
LWnetUnitsName = c('W/m2','W/m^2','Wm^{-2}','wm2','watt/m^2')
LWnetMultiplier = c(1,1,1,1,1)
LWnetAddition = c(0,0,0,0,0)
LWnetUnits = list(name=LWnetUnitsName,multiplier=LWnetMultiplier,
	addition=LWnetAddition)
# Ground heat flux:
QgUnitsName = c('W/m2','W/m^2','Wm^{-2}','wm2','watt/m^2')
QgMultiplier = c(1,1,1,1,1)
QgAddition = c(0,0,0,0,0)
QgUnits = list(name=QgUnitsName,multiplier=QgMultiplier,
	addition=QgAddition)
	
# Definitions of standard empirical benchmark levels:
benchnames = c('1lin','2lin','3km27')
benchx = list(c('SWdown'),c('SWdown','Tair'),c('SWdown','Tair','Qair'))
benchtype = c('mlr','mlr','kmeans')
benchparam = c(0,0,27)