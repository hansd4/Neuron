//
//  getDifficulty.c
//  Neuron
//
//  Created by Hans de los Santos on 12/14/23.
//

#include <stdio.h>

int postDifficulty(double time, int numAns, double avgExp){ //difficulty from 1-10, is also xp number
    if(time>3600){
        time/=3600;
        }
            else if(time>86400){
            time/=86400;
            }


    int diff;
    diff=(avgExp*0.5)+(numAns*0.3)+(time*0.2);


    if(diff<1){
        diff=1;
        return diff;
    }
    else if(diff>10){
        diff=10;
        return diff;
    }
    else return diff;
}
