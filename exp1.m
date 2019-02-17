clc                                       %MADHUKUMAR.S
clear all                                 %17BEE0117
close all
disp('MADHUKUMAR.S')
disp('17BEE0117')
disp('Inductance and capictance calculation')
disp('1.SINGLE PHASE SINGLE CIRCUIT');
disp('2.SINGLE PHASE DOUBLE CIRCUIT');
disp('3.THREE PHASE SINGLE CIRCUIT');
disp('4.THREE PHASE DOUBLE CIRCUIT');
n=input('Select the transmission line for which you need to calculate Inductance and capacitance');
if(n==1)
    disp('1.SINGLE PHASE SINGLE CIRCUIT (only for same diameters))');
    disp('A 0-------------0 B');
    disp('or');
    disp('A 0')
    disp('  |')
    disp('  |')
    disp('  |')
    disp('  |')
    disp('B 0')
    d=input('Enter the diameter in meter: ');
    r=(d/2)*exp(-1/4);
    D=input('Enter the distance between the txm line A and B : ');
    L=2*10^-7*log(D/r);
    disp('Inductance in H/m: ');
    disp(L);
    C=(2*pi*8.85*10^(-12))/log(D/r);
    disp('Capacitance between the Txm lines:');
    disp(C);
else if(n==2)
        disp('2.SINGLE PHASE DOUBLE CIRCUIT (only for same diameters)) ');
        d=input('Enter the diameter in meters: ');
        r=(d/2)*exp(-1/4);
        disp('a 0------------0 c')
        disp('  |            |')
        disp('  |            |')
        disp('  |            |')
        disp('  |            |')
        disp('  |            |')
        disp('b 0------------0 d')
        D_ab=input('Enter the D_ab: ');
        D_aB=input('Enter the D_aB: ');
        D_AB=input('Enter the D_AB: ');
        D_bA=input('Enter the D_bA: ');
        Dm=(D_ab*D_aB*D_AB*D_bA)^(1/4);
        D_aA=input('Enter the D_aA: ');
        Ds=(r*r*D_aA*D_aA)^(1/4);
        L=2*10^-7*log(Dm/Ds);
        disp('Inductance in H/m: ');
        disp(L);
        C=(2*pi*8.85*10^(-12))/log(Dm/Ds);
        disp('Capacitance between the Txm lines:');
        disp(C);
    else if(n==3)
            disp('3.THREE PHASE SINGLE CIRCUIT (only for same diameters))');
            disp('     a 0')
            disp('      /  \')
            disp('     /    \')
            disp('    /      \')
            disp('   /        \')
            disp('b 0----------0 c')
            Dab=input('Enter Dab: ');
            Dbc=input('Enter Dbc: ');
            Dca=input('Enter Dca: ');
            d=input('Enter the diameter in meters: ');
            Dm=(Dab*Dbc*Dca)^(1/3);
            Ds=(d/2)*exp(-1/4);
            L=2*10^-7*log(Dm/Ds);
            disp('Inductance in H/m: ');
            disp(L);
            C=(2*pi*8.85*10^(-12))/log(Dm/Ds);
            disp('Capacitance between the Txm lines:');
            disp(C);
        else if(n==4)
                disp('4.THREE PHASE DOUBLE CIRCUIT (only for same diameters)) ');
                 disp('  |            |')
                 disp('a-0-          -0- A')
                 disp('  |            |')
                 disp('                ')
                 disp('                ')
                 disp('                ')
                 disp('  |            |')
                 disp('b-0-          -0- B')
                 disp('  |            |')
                 disp('               ')
                 disp('                ')
                 disp('               ')
                 disp('  |            |')
                 disp('c 0-          -0- C')
                 disp('  |            |')
                D_ab=input('Enter D_ab: ');
                D_Ab=input('Enter D_Ab; ');
                D_aB=input('Enter D_aB: ');
                D_AB=input('Enter D_AB: ');
                D_bc=input('Enter D_bc: ');
                D_Bc=input('Enter D_Bc; ');
                D_bC=input('Enter D_bC: ');
                D_BC=input('Enter D_BC: ');
                D_ca=input('Enter D_ca: ');
                D_Ca=input('Enter D_Ca; ');
                D_cA=input('Enter D_cA: ');
                D_CA=input('Enter D_CA: ');
                D_aA=input('Enter D_aA: ');
                D_bB=input('Enter D_bB: ');
                D_cC=input('Enter D_cC: ');
                DA=(D_ab*D_Ab*D_aB*D_AB)^(1/4);
                DB=(D_bc*D_Bc*D_bC*D_BC)^(1/4);
                DC=(D_ca*D_Ca*D_cA*D_CA)^(1/4);
                Dm=(DA*DB*DC)^(1/3);
                d=input('Enter the diameter in meters: ');
                reff=(d/2)*exp(-1/4);
                Ds1=(reff*reff*D_aA*D_aA)^(1/4);
                Ds2=(reff*reff*D_bB*D_bB)^(1/4);
                Ds3=(reff*reff*D_cC*D_cC)^(1/4);
                Ds=(Ds1*Ds2*Ds3)^(1/3);
                L=2*10^-7*log(Dm/Ds);
                disp('Inductance in H/m: ');
                disp(L);
                C=(2*pi*8.85*10^(-12))/log(Dm/Ds);
                disp('Capacitance between the Txm lines:');
                disp(C);
            end
        end
    end
end

                
