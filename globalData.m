classdef globalData

    properties
        
        %%% TIMING %%%
        timestep = .0001 %s
        kalmanTimestep = .01 %s
        runtime = 20%s
        numSteps

        %%% SIMULATION OPTIONS %%%
        randomForceNoise=true;
        randomIMUNoise=true;
        randomSensorNoise=true;
        noiseModifierConst=0.005*ones(30,1);
        noiseModifierLin=0.002*ones(30,1);
        noiseModifierZero=[0*ones(29,1); -9.81];
        sensorFailure=false;
        failurePersist=true;
        failureRate=0.001;
        dispKalmanRange=1;
            
        %%% TUBE SPECS %%%
        pusherForce = 17640 % newtons
        pusherDistance = 273 % m
        
        %%% NATURAL CONSTANTS %%%
        gravity = 9.81 % m/s^2
        TEMPERATURE = 350 % K
        TUBE_PRESSURE = 1000 % Pa
        GAS_CONSTANT = 287.058 % Pa * m^3 / K
        airDensity
        
        %%% Covariances 'n stuff %%%
        peTopCovConst = .00001*ones(3,1);
        peLeftCovConst = .00001*ones(3,1);
        peRightCovConst = .00001*ones(3,1);
        pitotCovConst = .001
        distDownCovConst = .000001*ones(6,1);
        distDownRailCovConst = .000001*ones(5,1);
        distSideCovConst = .000001*ones(5,1);
        IMUAccelCovConst = .00001*ones(3,1);
        IMUGyroCovConst = .000001*ones(3,1);
        
        peTopCovLin = .00001*ones(3,1);
        peLeftCovLin = .00001*ones(3,1);
        peRightCovLin = .00001*ones(3,1);
        pitotCovLin = .001
        distDownCovLin = .000001*ones(6,1);
        distDownRailCovLin = .000001*ones(5,1);
        distSideCovLin = .00001*ones(5,1);
        IMUAccelCovLin = .00001*ones(3,1);
        IMUGyroCovLin = .000001*ones(3,1);
        
        peTopCovZero = 0*ones(3,1); %value where linear covariance addition is zero
        peLeftCovZero = 0*ones(3,1);
        peRightCovZero = 0*ones(3,1);
        pitotCovZero = 0
        distDownCovZero = 0.003*ones(6,1);
        distDownRailCovZero = 0.003*ones(5,1);
        distSideCovZero = 0.15*ones(5,1);
        IMUAccelCovZero = 0*ones(3,1);
        IMUGyroCovZero = 0*ones(3,1);
        
        
        correctCovariance = true %if using the covariances above to generate the noise as well as in the Kalman Filter. Else it uses covariances below.
        
        peTopSIMCovConst = .00001*ones(3,1);
        peLeftSIMCovConst = .00001*ones(3,1);
        peRightSIMCovConst = .00001*ones(3,1);
        pitotSIMCovConst = .001
        distDownSIMCovConst = .0001*ones(6,1);
        distDownRailSIMCovConst = .0001*ones(5,1);
        distSideSIMCovConst = .00001*ones(5,1);
        IMUAccelSIMCovConst = .00001*ones(3,1);
        IMUGyroSIMCovConst = .000001*ones(3,1);
        
        peTopSIMCovLin = .00001*ones(3,1);
        peLeftSIMCovLin = .00001*ones(3,1);
        peRightSIMCovLin = .00001*ones(3,1);
        pitotSIMCovLin = .001
        distDownSIMCovLin = .0001*ones(6,1);
        distDownRailSIMCovLin = .0001*ones(5,1);
        distSideSIMCovLin = .00001*ones(5,1);
        IMUAccelSIMCovLin = .00001*ones(3,1);
        IMUGyroSIMCovLin = .000001*ones(3,1);
               
        peTopSIMCovZero = 0*ones(3,1);
        peLeftSIMCovZero = 0*ones(3,1);
        peRightSIMCovZero = 0*ones(3,1);
        pitotSIMCovZero = 0
        distDownSIMCovZero = 0.003*ones(6,1);
        distDownRailSIMCovZero = 0.003*ones(5,1);
        distSideSIMCovZero = 0.01*ones(5,1);
        IMUAccelSIMCovZero = 0*ones(3,1);
        IMUGyroSIMCovZero = 0*ones(3,1);
        
        peTopMax=1.1*ones(3,1); %these are the values that the sensors would report if they returned the upper rail voltage
        peLeftMax=1.1*ones(3,1);
        peRightMax=1.1*ones(3,1);
        pitotMax=50;
        distDownMax=0.01*ones(6,1);
        distDownRailMax=0.01*ones(5,1);
        distSideMax=0.3*ones(5,1);
      
       
        
        peTopMin=-0.1*ones(3,1); %these are the values that the sensors would report if they returned the lower rail voltage
        peLeftMin=-0.1*ones(3,1);
        peRightMin=-0.1*ones(3,1);
        pitotMin=-5;
        distDownMin=0*ones(6,1);
        distDownRailMin=0*ones(5,1);
        distSideMin=0*ones(5,1);
        
        sensorMaxs
        sensorMins
        
    end
    methods
        function globals = globalData()
            globals.numSteps =globals.runtime / globals.timestep;
            globals.airDensity = globals.TUBE_PRESSURE...
                /(globals.GAS_CONSTANT*globals.TEMPERATURE);
             globals.sensorMaxs=[[globals.distDownMax] [globals.distDownRailMax; NaN] [globals.distSideMax; NaN]...
            [globals.pitotMax; nan(5,1)] [globals.peTopMax; nan(3,1)] [globals.peLeftMax; nan(3,1)] [globals.peRightMax; nan(3,1)]];
            globals.sensorMins=[[globals.distDownMin] [globals.distDownRailMin; NaN] [globals.distSideMin; NaN]...
            [globals.pitotMin; nan(5,1)] [globals.peTopMin; nan(3,1)] [globals.peLeftMin; nan(3,1)] [globals.peRightMin; nan(3,1)]];
          
        
        
        
        
        end        
    end
end
