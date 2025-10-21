% Transmission Line Parameter Calculator

clear all;

% Menu for transmission line selection
disp('1. SINGLE PHASE SINGLE CIRCUIT');
disp('2. SINGLE PHASE DOUBLE CIRCUIT'); 
disp('3. THREE PHASE SINGLE CIRCUIT');
disp('4. THREE PHASE DOUBLE CIRCUIT');

n = input('Select the transmission line type (1-4): ');

% Constants
epsilon_0 = 8.854 * 10^(-12); % Permittivity of free space (F/m)
mu_0 = 4 * pi * 10^(-7);      % Permeability of free space (H/m)

switch n
    case 1
        %% SINGLE PHASE SINGLE CIRCUIT
        disp('SINGLE PHASE SINGLE CIRCUIT');
        d = input('Enter conductor diameter in meters: ');
        r = d/2;
        GMR = r * exp(-1/4); % Geometric Mean Radius
        D = input('Enter distance between conductors A and B (meters): ');
        
        % Inductance calculation
        L = (mu_0/pi) * log(D/GMR);
        disp(['Inductance per meter: ', num2str(L), ' H/m']);
        
        % Capacitance calculation
        C = (pi * epsilon_0) / log(D/r);
        disp(['Capacitance per meter: ', num2str(C), ' F/m']);
        
    case 2
        %% SINGLE PHASE DOUBLE CIRCUIT
        disp('SINGLE PHASE DOUBLE CIRCUIT');
        d = input('Enter conductor diameter in meters: ');
        r = d/2;
        GMR = r * exp(-1/4);
        
        disp('Circuit configuration:');
        disp('a 0------------0 c');
        disp('  |            |');
        disp('  |            |'); 
        disp('  |            |');
        disp('  |            |');
        disp('b 0------------0 d');
        
        D_ab = input('Enter D_ab (distance between a and b): ');
        D_aB = input('Enter D_aB (distance between a and B): ');
        D_AB = input('Enter D_AB (distance between A and B): ');
        D_bA = input('Enter D_bA (distance between b and A): ');
        
        % Geometric Mean Distance
        Dm = (D_ab * D_aB * D_AB * D_bA)^(1/4);
        
        D_aA = input('Enter D_aA (distance between a and A): ');
        
        % Geometric Mean Radius
        Ds = (GMR * GMR * D_aA * D_aA)^(1/4);
        
        % Inductance calculation
        L = (mu_0/pi) * log(Dm/Ds);
        disp(['Inductance per meter: ', num2str(L), ' H/m']);
        
        % Capacitance calculation
        C = (pi * epsilon_0) / log(Dm/Ds);
        disp(['Capacitance per meter: ', num2str(C), ' F/m']);
        
    case 3
        %% THREE PHASE SINGLE CIRCUIT
        disp('THREE PHASE SINGLE CIRCUIT');
        disp('     a 0');
        disp('      /  \');
        disp('     /    \');
        disp('    /      \');
        disp('   /        \');
        disp('b 0----------0 c');
        
        Dab = input('Enter Dab (meters): ');
        Dbc = input('Enter Dbc (meters): ');
        Dca = input('Enter Dca (meters): ');
        d = input('Enter conductor diameter in meters: ');
        
        r = d/2;
        GMR = r * exp(-1/4);
        
        % Geometric Mean Distance
        Dm = (Dab * Dbc * Dca)^(1/3);
        
        % Inductance calculation
        L = (mu_0/(2*pi)) * log(Dm/GMR);
        disp(['Inductance per phase per meter: ', num2str(L), ' H/m']);
        
        % Capacitance calculation
        C = (2 * pi * epsilon_0) / log(Dm/r);
        disp(['Capacitance per phase per meter: ', num2str(C), ' F/m']);
        
    case 4
        %% THREE PHASE DOUBLE CIRCUIT
        disp('THREE PHASE DOUBLE CIRCUIT');
        disp('  |            |');
        disp('a 0           0 A');
        disp('  |            |');
        disp('  |            |');
        disp('b 0           0 B');
        disp('  |            |');
        disp('  |            |');
        disp('c 0           0 C');
        disp('  |            |');
        
        % Input distances
        D_ab = input('Enter D_ab: ');
        D_Ab = input('Enter D_Ab: ');
        D_aB = input('Enter D_aB: ');
        D_AB = input('Enter D_AB: ');
        
        D_bc = input('Enter D_bc: ');
        D_Bc = input('Enter D_Bc: ');
        D_bC = input('Enter D_bC: ');
        D_BC = input('Enter D_BC: ');
        
        D_ca = input('Enter D_ca: ');
        D_Ca = input('Enter D_Ca: ');
        D_cA = input('Enter D_cA: ');
        D_CA = input('Enter D_CA: ');
        
        D_aA = input('Enter D_aA: ');
        D_bB = input('Enter D_bB: ');
        D_cC = input('Enter D_cC: ');
        
        d = input('Enter conductor diameter in meters: ');
        r = d/2;
        GMR = r * exp(-1/4);
        
        % Calculate equivalent distances
        DA = (D_ab * D_Ab * D_aB * D_AB)^(1/4);
        DB = (D_bc * D_Bc * D_bC * D_BC)^(1/4);
        DC = (D_ca * D_Ca * D_cA * D_CA)^(1/4);
        Dm = (DA * DB * DC)^(1/3);
        
        % Calculate equivalent GMR
        Ds1 = (GMR * GMR * D_aA * D_aA)^(1/4);
        Ds2 = (GMR * GMR * D_bB * D_bB)^(1/4);
        Ds3 = (GMR * GMR * D_cC * D_cC)^(1/4);
        Ds = (Ds1 * Ds2 * Ds3)^(1/3);
        
        % Inductance calculation
        L = (mu_0/(2*pi)) * log(Dm/Ds);
        disp(['Inductance per phase per meter: ', num2str(L), ' H/m']);
        
        % Capacitance calculation
        C = (2 * pi * epsilon_0) / log(Dm/Ds);
        disp(['Capacitance per phase per meter: ', num2str(C), ' F/m']);
        
    otherwise
        disp('Invalid selection! Please choose between 1-4.');
end
