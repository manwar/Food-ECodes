package Food::ECodes;

use strict; use warnings;

use Carp;
use Readonly;
use Data::Dumper;

=head1 NAME

Food::ECodes - Interface to Food Additive ECodes.

=head1 VERSION

Version 0.08

=cut

our $VERSION = '0.08';

Readonly my $COLOURS =>
{
    'E100'  => { name     => 'Curcumin, turmeric',
                 purpose  => 'Food colouring (yellow-orange)',
                 approved => ['US', 'EU']
               },
    'E101'  => { name     => 'Riboflavin (Vitamin B2), formerly called lactoflavin (Vitamin G)',
                 purpose  => 'Food colouring (yellow-orange)',
                 approved => ['US', 'EU']
               },
    'E101A' => { name     => 'Riboflavin-5-Phosphate',
                 purpose  => 'Food colouring (yellow-orange)',
                 approved => ['EU']
               },     
    'E102'  => { name     => 'Tartrazine (FD&C Yellow 5)',
                 purpose  => 'Food colouring (lemon yellow)',
                 approved => ['EU', 'US']
               },     
    'E103'  => { name     => 'Alkannin',
                 purpose  => 'Food colouring'
               },
    'E104'  => { name     => 'Quinoline Yellow WS',
                 purpose  => 'Food colouring (dull or greenish yellow)',
                 approved => ['EU']
               },
    'E105'  => { name     => 'Fast Yellow AB',
                 purpose  => 'Food colouring (yellow)'
               },
    'E106'  => { name     => 'Riboflavin-5-Sodium Phosphate',
                 purpose  => 'Food colouring (yellow)'
               },
    'E107'  => { name     => 'Yellow 2G',
                 purpose  => 'Food colouring (yellow)'
               },
    'E110'  => { name     => 'Sunset Yellow FCF (Orange Yellow S, FD&C Yellow 6)',
                 purpose  => 'Food colouring (yellow-orange)',
                 approved => ['EU', 'US']
               },
    'E111'  => { name     => 'Orange GGN',
                 purpose  => 'Food colouring (orange)'
               },
    'E120'  => { name     => 'Cochineal, Carminic acid, Carmine (Natural Red 4)',
                 purpose  => 'Food colouring (crimson)',
                 approved => ['EU', 'US']
               },
    'E121'  => { name     => 'Citrus Red 2',
                 purpose  => 'Food colouring (dark red)',
                 approved => ['EU']
               },
    'E122'  => { name     => 'Carmoisine, Azorubine',
                 purpose  => 'Food colouring (red to maroon)',
                 approved => ['EU']
               },
    'E123'  => { name     => 'Amaranth (FD&C Red 2)',
                 purpose  => 'Food colouring (dark red)',
                 approved => ['EU']
               },
    'E124'  => { name     => 'Ponceau 4R (Cochineal Red A, Brilliant Scarlet 4R)',
                 purpose  => 'Food colouring (red)',
                 approved => ['EU']
               },     
    'E125'  => { name     => 'Ponceau SX, Scarlet GN',
                 purpose  => 'Food colouring (red)' 
               },
    'E126'  => { name     => 'Ponceau 6R',
                 purpose  => 'Food colouring (red)'
               },
    'E127'  => { name     => 'Erythrosine (FD&C Red 3)',
                 purpose  => 'Food colouring (red)',
                 approved => ['EU', 'US']
               },     
    'E128'  => { name     => 'Red 2G',
                 purpose  => 'Food colouring (red)'
               },     
    'E129'  => { name     => 'Allura Red AC (FD&C Red 40)',
                 purpose  => 'Food colouring (red)',
                 approved => ['EU', 'US']
               },
    'E130'  => { name     => 'Indanthrene blue RS',
                 purpose  => 'Food colouring (blue)'
               },
    'E131'  => { name     => 'Patent Blue V',
                 purpose  => 'Food colouring (dark blue)',
                 approved => ['EU']
               },    
    'E132'  => { name     => 'Indigo carmine (indigotine, FD&C Blue 2)',
                 purpose  => 'Food colouring (indigo)',
                 approved => ['EU', 'US']
               },     
    'E133'  => { name     => 'Brilliant Blue FCF (FD&C Blue 1)',
                 purpose  => 'Food colouring (reddish blue)',
                 approved => ['EU', 'US']
               },
    'E140'  => { name     => 'Chlorophylls and Chlorophyllins: (i) Chlorophylls (ii) Chlorophyllins',
                 purpose  => 'Food colouring (green)',
                 approved => ['EU']
               },     
    'E141'  => { name     => 'Copper complexes of chlorophylls and chlorophyllins (i) Copper complexes of chlorophylls (ii) Copper complexes of chlorophyllins',
                 purpose  => 'Food colouring (green)',
                 approved => ['EU', 'US']
               },
    'E142'  => { name     => 'Green S',
                 purpose  => 'Food colouring (green)',
                 approved => ['EU']
               },     
    'E143'  => { name     => 'Fast Green FCF (FD&C Green 3)',
                 purpose  => 'Food colouring (sea green)' 
               },
    'E150A' => { name     => 'Plain caramel',
                 purpose  => 'Food colouring',
                 approved => ['EU', 'US']
               },
    'E150B' => { name     => 'Caustic sulphite caramel',
                 purpose  => 'Food colouring',
                 approved => ['EU','US']
               },
    'E150C' => { name     => 'Ammonia caramel',
                 purpose  => 'Food colouring',
                 approved => ['EU','US']
               },     
    'E150D' => { name     => 'Sulphite ammonia caramel',
                 purpose  => 'Food colouring',
                 approved => ['US']
               },
    'E151'  => { name     => 'Black PN, Brilliant Black BN',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E152'  => { name     => 'Black 7984',
                 purpose  => 'Food colouring'
               },
    'E153'  => { name     => 'Carbon black, Vegetable carbon',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E154'  => { name     => 'Brown FK (kipper brown)',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E155'  => { name     => 'Brown HT (chocolate brown HT)',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E160A' => { name     => 'Alpha-carotene, Beta-carotene, Gamma-carotene',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E160B' => { name     => 'Annatto, bixin, norbixin',
                 purpose  => 'Food colouring',
                 approved => ['EU','US']
               },
    'E160C' => { name     => 'Paprika oleoresin, Capsanthin, capsorubin',
                 purpose  => 'Food colouring',
                 approved => ['EU','US']
               },
    'E160D' => { name     => 'Lycopene',
                 purpose  => 'Food colouring',
                 approved => ['EU','US']
               },
    'E160E' => { name     => 'Beta-apo-8-carotenal (C 30)',
                 purpose  => 'Food colouring',
                 approved => ['EU', 'US']
               },
    'E160F' => { name     => 'Ethyl ester of beta-apo-8-carotenic acid (C 30)',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E161A' => { name     => 'Flavoxanthin',
                 purpose  => 'Food colouring'
               },
    'E161B' => { name     => 'Lutein',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E161C' => { name     => 'Cryptoxanthin',
                 purpose  => 'Food colouring'
               },
    'E161D' => { name     => 'Rubixanthin',
                 purpose  => 'Food colouring'
               },    
    'E161E' => { name     => 'Violaxanthin',
                 purpose  => 'Food colouring'
               },
    'E161F' => { name     => 'Rhodoxanthin',
                 purpose  => 'Food colouring'
               },
    'E161G' => { name     => 'Canthaxanthin',
                 purpose  => 'Food colouring',
                 approved => ['EU','US']
               },
    'E161H' => { name     => 'Zeaxanthin',
                 purpose  => 'Food colouring'
               },
    'E161I' => { name     => 'Citranaxanthin',
                 purpose  => 'Food colouring'
               },
    'E161J' => { name     => 'Astaxanthin',
                 purpose  => 'Food colouring'
               },
    'E162'  => { name     => 'Beetroot Red, Betanin',
                 purpose  => 'Food colouring',
                 approved => ['EU','US']
               },
    'E163'  => { name     => 'Anthocyanins',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E164'  => { name     => 'Saffron',
                 purpose  => 'Food colouring',
                 approved => ['US']
               },
    'E166'  => { name     => 'Sandalwood red',
                 purpose  => 'Food colouring'
               },
    'E170'  => { name     => 'Calcium carbonate, Chalk',
                 purpose  => 'Food colouring',     
                 approved => ['EU']
               },
    'E171'  => { name     => 'Titanium dioxide',
                 purpose  => 'Food colouring (pure white)',
                 approved => ['EU','US']
               },
    'E172'  => { name     => 'Iron oxides and iron hydroxides',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E173'  => { name     => 'Aluminium',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E174'  => { name     => 'Silver',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E175'  => { name     => 'Gold',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E180'  => { name     => 'Pigment Rubine, Lithol Rubine BK',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },
    'E181'  => { name     => 'Tannin',
                 purpose  => 'Food colouring'
               },
    'E182'  => { name     => 'Orcein, Orchil',
                 purpose  => 'Food colouring'
               }
};

Readonly my $PRESERVATIVES =>
{
    'E200'  => { name     => 'Sorbic acid',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E201'  => { name     => 'Sodium sorbate',
                 purpose  => 'Preservative',
                },
    'E202'  => { name     => 'Potassium sorbate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E203'  => { name     => 'Calcium sorbate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E209'  => { name     => 'Heptyl p-hydroxybenzoate',
                 purpose  => 'Preservative'
                },
    'E210'  => { name     => 'Benzoic acid',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E211'  => { name     => 'Sodium benzoate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E212'  => { name     => 'Potassium benzoate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E213'  => { name     => 'Calcium benzoate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E214'  => { name     => 'Ethylparaben (ethyl para-hydroxybenzoate)',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E215'  => { name     => 'Sodium ethyl para-hydroxybenzoate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E216'  => { name     => 'Propylparaben (propyl para-hydroxybenzoate)',
                 purpose  => 'Preservative'
               },
    'E217'  => { name     => 'Sodium propyl para-hydroxybenzoate',
                 purpose  => 'Preservative'
               },
    'E218'  => { name     => 'Methylparaben (methyl para-hydroxybenzoate)',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E219'  => { name     => 'Sodium methyl para-hydroxybenzoate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E220'  => { name     => 'Sulphur dioxide',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E221'  => { name     => 'Sodium sulphite',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E222'  => { name     => 'Sodium bisulphite (sodium hydrogen sulphite)',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E223'  => { name     => 'Sodium metabisulphite',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E224'  => { name     => 'Potassium metabisulphite',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E225'  => { name     => 'Potassium sulphite',
                 purpose  => 'Preservative'
               },
    'E226'  => { name     => 'Calcium sulphite',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E227'  => { name     => 'Calcium hydrogen sulphite (preservative)',
                 purpose  => 'firming agent',
                 approved => ['EU']
               },
    'E228'  => { name     => 'Potassium hydrogen sulphite',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E230'  => { name     => 'Biphenyl, diphenyl',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E231'  => { name     => 'Orthophenyl phenol',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E232'  => { name     => 'Sodium orthophenyl phenol',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E233'  => { name     => 'Thiabendazole',
                 purpose  => 'Preservative'
               },
    'E234'  => { name     => 'Nisin',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E235'  => { name     => 'Natamycin, Pimaracin',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E236'  => { name     => 'Formic acid',
                 purpose  => 'Preservative'
               },
    'E237'  => { name     => 'Sodium formate',
                 purpose  => 'Preservative'
               },
    'E238'  => { name     => 'Calcium formate',
                 purpose  => 'Preservative'
               },
    'E239'  => { name     => 'Hexamine (hexamethylene tetramine)',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E240'  => { name     => 'Formaldehyde',
                 purpose  => 'Preservative'
               },
    'E242'  => { name     => 'Dimethyl dicarbonate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E249'  => { name     => 'Potassium nitrite',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E250'  => { name     => 'Sodium nitrite',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E251'  => { name     => 'Sodium nitrate (Chile saltpeter)',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E252'  => { name     => 'Potassium nitrate (Saltpetre)',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E260'  => { name     => 'Acetic acid (preservative)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E261'  => { name     => 'Potassium acetate (preservative)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E262'  => { name     => 'Sodium acetates (i) Sodium acetate (ii) Sodium hydrogen acetate (sodium diacetate)',
                 purpose  => 'Preservative, acidity regulator',
                 approved => ['EU']
               },
    'E263'  => { name     => 'Calcium acetate (preservative)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E264'  => { name     => 'Ammonium acetate',
                 purpose  => 'Preservative'
               },
    'E265'  => { name     => 'Dehydroacetic acid',
                 purpose  => 'Preservative'
               },     
    'E266'  => { name     => 'Sodium dehydroacetate',
                 purpose  => 'Preservative'
               },
    'E270'  => { name     => 'Lactic acid (preservative) (acid)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },
    'E280'  => { name     => 'Propionic acid',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E281'  => { name     => 'Sodium propionate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E282'  => { name     => 'Calcium propionate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E283'  => { name     => 'Potassium propionate',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E284'  => { name     => 'Boric acid',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E285'  => { name     => 'Sodium tetraborate (borax)',
                 purpose  => 'Preservative',
                 approved => ['EU']
               },
    'E290'  => { name     => 'Carbon dioxide',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E296'  => { name     => 'Malic acid (acid)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E297'  => { name     => 'Fumaric acid',
                 purpose  => 'Acidity regulator'
               }
};

Readonly my $ANTIOXIDANTS_ACIDITY_REGULATORS =>
{
    'E300'  => { name     => 'Ascorbic acid (Vitamin C)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E301'  => { name     => 'Sodium ascorbate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },
    'E302'  => { name     => 'Calcium ascorbate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },
    'E303'  => { name     => 'Potassium ascorbate',
                 purpose  => 'Antioxidant'
               },
    'E304'  => { name     => 'Fatty acid esters of ascorbic acid (Ascorbyl palmitate)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },                 
    'E305'  => { name     => 'Ascorbyl stearate',
                 purpose  => 'Antioxidant'
               },
    'E306'  => { name     => 'Tocopherols (natural)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E307'  => { name     => 'Alpha-tocopherol (synthetic)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E308'  => { name     => 'Gamma-tocopherol (synthetic)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E309'  => { name     => 'Delta-tocopherol (synthetic)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E310'  => { name     => 'Propyl gallate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E311'  => { name     => 'Octyl gallate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E312'  => { name     => 'Dodecyl gallate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E313'  => { name     => 'Ethyl gallate',
                 purpose  => 'Antioxidant'
               },     
    'E314'  => { name     => 'Guaiac resin',
                 purpose  => 'Antioxidant'
               },     
    'E315'  => { name     => 'Erythorbic acid',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E316'  => { name     => 'Sodium erythorbate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E317'  => { name     => 'Erythorbin acid',
                 purpose  => 'Antioxidant'
               },     
    'E318'  => { name     => 'Sodium erythorbin',
                 purpose  => 'Antioxidant'
               },     
    'E319'  => { name     => 'tert-Butylhydroquinone (TBHQ)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E320'  => { name     => 'Butylated hydroxyanisole (BHA)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E321'  => { name     => 'Butylated hydroxytoluene (BHT)',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E322'  => { name     => 'Lecithin',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E323'  => { name     => 'Anoxomer',
                 purpose  => 'Antioxidant'
               },      
    'E324'  => { name     => 'Ethoxyquin',
                 purpose  => 'Antioxidant'
               },     
    'E325'  => { name     => 'Sodium lactate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E326'  => { name     => 'Potassium lactate (antioxidant)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E327'  => { name     => 'Calcium lactate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E328'  => { name     => 'Ammonium lactate',
                 purpose  => 'Acidity regulator'
               },     
    'E329'  => { name     => 'Magnesium lactate',
                 purpose  => 'Acidity regulator'
               },    
    'E330'  => { name     => 'Citric acid',
                 purpose  => 'Acid, acidity regulator',
                 approved => ['EU']
               },
    'E331'  => { name     => 'Sodium citrates (i) Monosodium citrate (ii) Disodium citrate (iii) Sodium citrate (trisodium citrate)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E332'  => { name     => 'Potassium citrates (i) Monopotassium citrate (ii) Potassium citrate (tripotassium citrate)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E333'  => { name     => 'Calcium citrates (i) Monocalcium citrate (ii) Dicalcium citrate (iii) Calcium citrate (tricalcium citrate)',
                 purpose  => 'Acidity regulator, firming agent, sequestrant',
                 approved => ['EU']
               },
    'E334'  => { name     => 'Tartaric acid (L(+)-)',
                 purpose  => 'Acid',
                 approved => ['EU']
               },
    'E335'  => { name     => 'Sodium tartrates (i) Monosodium tartrate (ii), Disodium tartrate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E336'  => { name     => 'Potassium tartrates (i) Monopotassium tartrate (cream of tartar) (ii) Dipotassium tartrate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E337'  => { name     => 'Sodium potassium tartrate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E338'  => { name     => 'Orthophosphoric acid',
                 purpose  => 'Acid',
                 approved => ['EU']
               },
    'E339'  => { name     => 'Sodium phosphates (i) Monosodium phosphate (ii) Disodium phosphate (iii) Trisodium phosphate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },
    'E340'  => { name     => 'Potassium phosphates (i) Monopotassium phosphate (ii) Dipotassium phosphate (iii) Tripotassium phosphate',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E341'  => { name     => 'Calcium phosphates (i) Monocalcium phosphate (ii) Dicalcium phosphate (iii) Tricalcium phosphate',
                 purpose  => 'Anti-caking agent, firming agent',
                 approved => ['EU']
               },     
    'E342'  => { name     => 'Ammonium phosphates: (i) monoammonium phosphate (ii) diammonium phosphate' },
    'E343'  => { name     => 'Magnesium phosphates (i) monomagnesium phosphate (ii) Dimagnesium phosphate',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E344'  => { name     => 'Lecitin citrate',
                 purpose  => 'Acidity regulator'
               },      
    'E345'  => { name     => 'Magnesium citrate',
                 purpose  => 'Acidity regulator'
               },     
    'E349'  => { name     => 'Ammonium malate',
                 purpose  => 'Acidity regulator'
               },     
    'E350'  => { name     => 'Sodium malates (i) Sodium malate (ii) Sodium hydrogen malate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E351'  => { name     => 'Potassium malate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E352'  => { name     => 'Calcium malates (i) Calcium malate (ii) Calcium hydrogen malate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },
    'E353'  => { name     => 'Metatartaric acid',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E354'  => { name     => 'Calcium tartrate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E355'  => { name     => 'Adipic acid',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E356'  => { name     => 'Sodium adipate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E357'  => { name     => 'Potassium adipate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E359'  => { name     => 'Ammonium adipate',
                 purpose  => 'Acidity regulator'
               },     
    'E363'  => { name     => 'Succinic acid',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E365'  => { name     => 'Sodium fumarate',
                 purpose  => 'Acidity regulator'
               },     
    'E366'  => { name     => 'Potassium fumarate',
                 purpose  => 'Acidity regulator'
               },
    'E367'  => { name     => 'Calcium fumarate',
                 purpose  => 'Acidity regulator'
               },     
    'E368'  => { name     => 'Ammonium fumarate',
                 purpose  => 'Acidity regulator'
               },     
    'E370'  => { name     => '1,4-Heptonolactone',
                 purpose  => 'Acidity regulator'
               },     
    'E375'  => { name     => 'Niacin (nicotinic acid), Nicotinamide',
                 purpose  => 'Colour retention agent'
               },     
    'E380'  => { name     => 'Triammonium citrate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E381'  => { name     => 'Ammonium ferric citrate',
                 purpose  => 'Acidity regulator'
               },     
    'E383'  => { name     => 'Calcium glycerylphosphate',
                 purpose  => 'Acidity regulator'
               },     
    'E384'  => { name     => 'Isopropyl citrate',
                 purpose  => 'Acidity regulator'
               },     
    'E385'  => { name     => 'Calcium disodium ethylene diamine tetraacetate, (Calcium disodium EDTA)',
                 purpose  => 'Sequestrant',
                 approved => ['EU']
               },     
    'E386'  => { name     => 'Disodium ethylene diamine tetraacetate (Disodium EDTA)',
                 purpose  => 'Sequestrant'
               },     
    'E387'  => { name     => 'Oxystearin',
                 purpose  => 'Stabiliser'
               }, 
    'E388'  => { name     => 'Thiodipropionic acid'       },
    'E389'  => { name     => 'Dilauryl thiodipropionate'  },
    'E390'  => { name     => 'Distearyl thiodipropionate' },
    'E391'  => { name     => 'Phytic acid'                },
    'E392'  => { name     => 'Extracts of rosemary'       },
    'E399'  => { name     => 'Calcium lactobionate'       }
};

Readonly my $THICKENERS_STABLISERS_EMULSIFIERS =>
{
    'E400'  => { name     => 'Alginic acid (thickener) (stabiliser) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E401'  => { name     => 'Sodium alginate (thickener) (stabiliser) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E402'  => { name     => 'Potassium alginate (thickener) (stabiliser) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E403'  => { name     => 'Ammonium alginate (thickener) (stabiliser)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E404'  => { name     => 'Calcium alginate (thickener) (stabiliser) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E405'  => { name     => 'Propane-1,2-diol alginate (Propylene glycol alginate) (thickener) (stabiliser)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E406'  => { name     => 'Agar (thickener) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E407'  => { name     => 'Carrageenan (thickener) (stabiliser) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E407a' => { name     => 'Processed eucheuma seaweed (thickener) (stabiliser) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E408'  => { name     => 'Bakers yeast',
                 purpose  => 'glycan'
               },     
    'E409'  => { name     => 'Arabinogalactan' },
    'E410'  => { name     => 'Locust bean gum (Carob gum) (thickener) (stabiliser) (gelling agent)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },                 
    'E411'  => { name     => 'Oat gum (thickener)',
                 purpose  => 'Stabiliser',
               },      
    'E412'  => { name     => 'Guar gum (thickener)',
                 purpose  => 'Stabiliser',
                 approved => ['EU']
               },     
    'E413'  => { name     => 'Tragacanth (thickener) (stabiliser)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E414'  => { name     => 'Acacia gum (gum arabic) (thickener) (stabiliser)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E415'  => { name     => 'Xanthan gum (thickener)',
                 purpose  => 'Stabiliser',
                 approved => ['EU']
               },     
    'E416'  => { name     => 'Karaya gum (thickener) (stabiliser)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },
    'E417'  => { name     => 'Tara gum (thickener)',
                 purpose  => 'Stabiliser',
                 approved => ['EU']
               },     
    'E418'  => { name     => 'Gellan gum (thickener) (stabiliser)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },
    'E419'  => { name     => 'Gum ghatti (thickener) (stabiliser)',
                 purpose  => 'Emulsifier'
               },     
    'E420'  => { name     => 'Sorbitol (i) Sorbitol (ii) Sorbitol syrup (emulsifier) (sweetener)',
                 purpose  => 'Humectant',
                 approved => ['EU']
               },
    'E421'  => { name     => 'Mannitol (anti-caking agent)',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },     
    'E422'  => { name     => 'Glycerol (emulsifier)',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },     
    'E424'  => { name     => 'Curdlan' },         
    'E425'  => { name     => 'Konjac (i) Konjac gum (ii) Konjac glucomannane',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E426'  => { name     => 'Soybean hemicellulose',
                 approved => ['EU']
               },     
    'E427'  => { name     => 'Cassia gum',
                 approved => ['EU']
               },     
    'E429'  => { name     => 'Peptones' },
    'E430'  => { name     => 'Polyoxyethene (8) stearate (emulsifier)',
                 purpose  => 'Stabiliser'
               },     
    'E431'  => { name     => 'Polyoxyethene (40) stearate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E432'  => { name     => 'Polyoxyethene (20) sorbitan monolaurate (polysorbate 20)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E433'  => { name     => 'Polyoxyethene (20) sorbitan monooleate (polysorbate 80)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E434'  => { name     => 'Polyoxyethene (20) sorbitan monopalmitate (polysorbate 40)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E435'  => { name     => 'Polyoxyethene (20) sorbitan monostearate (polysorbate 60)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E436'  => { name     => 'Polyoxyethene (20) sorbitan tristearate (polysorbate 65)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E440'  => { name     => 'Pectins (i) pectin (ii) amidated pectin',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E441'  => { name     => 'Gelatine (emulsifier)',
                 purpose  => 'Gelling agent'
               },         
    'E442'  => { name     => 'Ammonium phosphatides',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E443'  => { name     => 'Brominated',
                 purpose  => 'Vegetable oil'
               },     
    'E444'  => { name     => 'Sucrose acetate isobutyrate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E445'  => { name     => 'Glycerol esters of wood rosins',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },
    'E446'  => { name     => 'Succistearin' },
    'E450'  => { name     => 'Diphosphates (i) Disodium diphosphate (ii) Trisodium diphosphate (iii) Tetrasodium diphosphate (iv) Dipotassium diphosphate (v) Tetrapotassium diphosphate (vi) Dicalcium diphosphate (vii) Calcium dihydrogen diphosphate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E451'  => { name     => 'Triphosphates (i) Sodium triphosphate (pentasodium triphosphate) (ii) Pentapotassium triphosphate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E452'  => { name     => 'Polyphosphates (i) Sodium polyphosphates (ii) Potassium polyphosphates (iii) Sodium calcium polyphosphate (iv) Calcium polyphosphates (v) Ammonium Polyphosphate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E459'  => { name     => 'Beta-cyclodextrin',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E460'  => { name     => 'Cellulose (i) Microcrystalline cellulose (ii) Powdered cellulose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E461'  => { name     => 'Methyl cellulose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E462'  => { name     => 'Ethyl cellulose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E463'  => { name     => 'Hydroxypropyl cellulose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E464'  => { name     => 'Hydroxy propyl methyl cellulose, = hypromellose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E465'  => { name     => 'Ethyl methyl cellulose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E466'  => { name     => 'Carboxymethyl cellulose, Sodium carboxy methyl cellulose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E467'  => { name     => 'Ethyl hydroxyethyl',
                 purpose  => 'Cellulose'
               },     
    'E468'  => { name     => 'Crosslinked sodium carboxymethyl cellulose (Croscarmellose)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E469'  => { name     => 'Enzymically hydrolysed carboxymethylcellulose',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E470A' => { name     => 'Sodium, potassium and calcium salts of fatty acids (emulsifier)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E470B' => { name     => 'Magnesium salts of fatty acids (emulsifier)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E471'  => { name     => 'Mono- and diglycerides of fatty acids (glyceryl monostearate, glyceryl distearate)',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E472A' => { name     => 'Acetic acid esters of mono- and diglycerides of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E472B' => { name     => 'Lactic acid esters of mono- and diglycerides of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E472C' => { name     => 'Citric acid esters of mono- and diglycerides of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E472D' => { name     => 'Tartaric acid esters of mono- and diglycerides of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E472E' => { name     => 'Mono- and diacetyl tartaric acid esters of mono- and diglycerides of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E472F' => { name     => 'Mixed acetic and tartaric acid esters of mono- and diglycerides of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E472G' => { name     => 'Succinylated monoglycerides',
                 purpose  => 'Emulsifier'
               },     
    'E473'  => { name     => 'Sucrose esters of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E474'  => { name     => 'Sucroglycerides',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E475'  => { name     => 'Polyglycerol esters of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E476'  => { name     => 'Polyglycerol polyricinoleate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E477'  => { name     => 'Propane-1,2-diol esters of fatty acids, propylene glycol esters of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E478'  => { name     => 'Lactylated fatty acid esters of glycerol and propane-1',
                 purpose  => 'Emulsifier'
               },     
    'E479B' => { name     => 'Thermally oxidized soya bean oil interacted with mono- and diglycerides of fatty acids',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E480'  => { name     => 'Dioctyl sodium sulphosuccinate',
                 purpose  => 'Emulsifier'
               },     
    'E481'  => { name     => 'Sodium stearoyl-2-lactylate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E482'  => { name     => 'Calcium stearoyl-2-lactylate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E483'  => { name     => 'Stearyl tartrate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E484'  => { name     => 'Stearyl citrate',
                 purpose  => 'Emulsifier'
               },     
    'E485'  => { name     => 'Sodium stearoyl fumarate',
                 purpose  => 'Emulsifier'
               },
    'E486'  => { name     => 'Calcium stearoyl fumarate',
                 purpose  => 'Emulsifier'
               },     
    'E487'  => { name     => 'Sodium laurylsulphate',
                 purpose  => 'Emulsifier'
               },     
    'E488'  => { name     => 'Ethoxylated Mono- and Di-Glycerides',
                 purpose  => 'Emulsifier'
               },     
    'E489'  => { name     => 'Methyl glucoside-coconut oil ester',
                 purpose  => 'Emulsifier'
               },     
    'E490'  => { name     => 'Propane-1,2-diol' },
    'E491'  => { name     => 'Sorbitan monostearate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E492'  => { name     => 'Sorbitan tristearate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E493'  => { name     => 'Sorbitan monolaurate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E494'  => { name     => 'Sorbitan monooleate',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E495'  => { name     => 'Sorbitan monopalmitate',
                 purpose  => 'Emulsifier',
               },     
    'E496'  => { name     => 'Sorbitan trioleate',
                 purpose  => 'Emulsifier',
               },     
    'E497'  => { name     => 'Polyoxypropylene-polyoxyethylene',
                 purpose  => 'Polymers'
               },     
    'E498'  => { name     => 'Partial polyglycerol esters of polycondensed fatty acids of castor oil' }
};

Readonly my $PH_REGULATORS_ANTI_CAKING_AGENTS =>
{
    'E500'  => { name     => 'Sodium carbonates (i) Sodium carbonate (ii) Sodium bicarbonate (Sodium hydrogen carbonate) (iii) Sodium sesquicarbonate (acidity regulator)',
                 purpose  => 'Raising agent',
                 approved => ['EU']
               }, 
    'E501'  => { name     => 'Potassium carbonates (i) Potassium carbonate (ii) Potassium bicarbonate (Potassium hydrogen carbonate)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E503'  => { name     => 'Ammonium carbonates (i) Ammonium carbonate (ii) Ammonium bicarbonate (Ammonium hydrogen carbonate)',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E504'  => { name     => 'Magnesium carbonates (i) Magnesium carbonate (ii) Magnesium bicarbonate Magnesium hydrogen carbonate',
                 purpose  => 'Acidity regulator, anti-caking agent',
                 approved => ['EU']
               },     
    'E505'  => { name     => 'Ferrous carbonate',
                 purpose  => 'Acidity regulator',
               },     
    'E507'  => { name     => 'Hydrochloric acid',
                 purpose  => 'Acid',
                 approved => ['EU']
               }, 
    'E508'  => { name     => 'Potassium chloride (gelling agent)',
                 purpose  => 'Seasoning',
                 approved => ['EU']
               },     
    'E509'  => { name     => 'Calcium chloride (sequestrant)',
                 purpose  => 'Firming agent',
                 approved => ['EU']
               },     
    'E510'  => { name     => 'Ammonium chloride, ammonia solution (acidity regulator)',
                 purpose  => 'Improving agent',
               },     
    'E511'  => { name     => 'Magnesium chloride',
                 purpose  => 'Firming agent',
                 approved => ['EU']
               },     
    'E512'  => { name     => 'Stannous chloride',
                 purpose  => 'Antioxidant',
                 approved => ['EU']
               },     
    'E513'  => { name     => 'Sulphuric acid',
                 purpose  => 'Acid',
                 approved => ['EU']
               },     
    'E514'  => { name     => 'Sodium sulphates (i) Sodium sulphate (ii)',
                 purpose  => 'Acid',
                 approved => ['EU']
               },     
    'E515'  => { name     => 'Potassium Sulphates (i) Potassium Sulphate (ii)',
                 approved => ['EU']
               },     
    'E516'  => { name     => 'Calcium sulphate',
                 approved => ['EU']
               },     
    'E517'  => { name     => 'Ammonium sulphate',
                 purpose  => 'Improving agent',
                 approved => ['EU']
               },     
    'E518'  => { name     => 'Magnesium sulphate (Epsom salts), (acidity regulator)',
                 purpose  => 'Firming agent',
               },     
    'E519'  => { name     => 'Copper(II) sulphate',
                 purpose  => 'Preservative',
               },     
    'E520'  => { name     => 'Aluminium sulphate',
                 purpose  => 'Firming agent',
                 approved => ['EU']
               },     
    'E521'  => { name     => 'Aluminium sodium sulphate',
                 purpose  => 'Firming agent',
                 approved => ['EU']
               },     
    'E522'  => { name     => 'Aluminium potassium sulphate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E523'  => { name     => 'Aluminium ammonium sulphate',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E524'  => { name     => 'Sodium hydroxide',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E525'  => { name     => 'Potassium hydroxide',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E526'  => { name     => 'Calcium hydroxide (acidity regulator)',
                 purpose  => 'Firming agent',
                 approved => ['EU']
               },     
    'E527'  => { name     => 'Ammonium hydroxide',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E528'  => { name     => 'Magnesium hydroxide',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E529'  => { name     => 'Calcium oxide (acidity regulator)',
                 purpose  => 'Improving agent',
                 approved => ['EU']
               },     
    'E530'  => { name     => 'Magnesium oxide (acidity regulator)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E535'  => { name     => 'Sodium ferrocyanide (acidity regulator)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E536'  => { name     => 'Potassium ferrocyanide',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E537'  => { name     => 'Ferrous hexacyanomanganate',
                 purpose  => 'Anti-caking agent'
               },     
    'E538'  => { name     => 'Calcium ferrocyanide',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E539'  => { name     => 'Sodium thiosulphate',
                 purpose  => 'Antioxidant',
               },     
    'E540'  => { name     => 'Dicalcium diphosphate (acidity regulator)',
                 purpose  => 'Emulsifier'
               },     
    'E541'  => { name     => 'Sodium aluminium phosphate (i) Acidic (ii) Basic',
                 purpose  => 'Emulsifier',
                 approved => ['EU']
               },     
    'E542'  => { name     => 'Bone phosphate (Essentiale Calcium Phosphate, Tribasic)',
                 purpose  => 'Anti-caking agent'
               },     
    'E543'  => { name     => 'Calcium sodium polyphosphate',
                 purpose  => 'Emulsifier'
               },     
    'E544'  => { name     => 'Calcium polyphosphate',
                 purpose  => 'Emulsifier'
               },     
    'E545'  => { name     => 'Ammonium polyphosphate',
                 purpose  => 'Emulsifier'
               },         
    'E550'  => { name     => 'Sodium Silicates (i) Sodium silicate (ii) Sodium metasilicate',
                 purpose  => 'Anti-caking agent'
               },     
    'E551'  => { name     => 'Silicon dioxide (Silica)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E552'  => { name     => 'Calcium silicate',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E553A' => { name     => '(i) Magnesium silicate (ii) Magnesium trisilicate',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E553B' => { name     => 'Talc',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E554'  => { name     => 'Sodium aluminosilicate (sodium aluminium silicate)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E555'  => { name     => 'Potassium aluminium silicate',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E556'  => { name     => 'Calcium aluminosilicate (calcium aluminium silicate)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E557'  => { name     => 'Zinc silicate',
                 purpose  => 'Anti-caking agent',
               },     
    'E558'  => { name     => 'Bentonite',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E559'  => { name     => 'Aluminium silicate (Kaolin)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E560'  => { name     => 'Potassium silicate',
                 purpose  => 'Anti-caking agent'
               },     
    'E561'  => { name     => 'Vermiculite' },
    'E562'  => { name     => 'Sepiolite' },
    'E563'  => { name     => 'Sepiolitic clay' },
    'E565'  => { name     => '4-Hexylresorcinol',
                 approved => ['EU']
               },     
    'E566'  => { name     => 'Natrolite-phonolite' },
    'E570'  => { name     => 'Stearic acid (Fatty acid)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },     
    'E572'  => { name     => 'Magnesium stearate, calcium stearate (emulsifier)',
                 purpose  => 'Anti-caking agent'
               },     
    'E574'  => { name     => 'Gluconic acid',
                 purpose  => 'Acidity regulator',
                 approved => ['EU']
               },     
    'E575'  => { name     => 'Glucono delta-lactone (acidity regulator)',
                 purpose  => 'Sequestrant',
                 approved => ['EU']
               },     
    'E576'  => { name     => 'Sodium gluconate',
                 purpose  => 'Sequestrant',
                 approved => ['EU']
               },     
    'E577'  => { name     => 'Potassium gluconate',
                 purpose  => 'Sequestrant',
                 approved => ['EU']
               },     
    'E578'  => { name     => 'Calcium gluconate',
                 purpose  => 'Firming agent',
                 approved => ['EU']
               },     
    'E579'  => { name     => 'Ferrous gluconate',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },     
    'E580'  => { name     => 'Magnesium gluconate' },
    'E585'  => { name     => 'Ferrous lactate',
                 purpose  => 'Food colouring',
                 approved => ['EU']
               },     
    'E586'  => { name     => '4-Hexylresorcinol',
                 purpose  => 'Antioxidant'
               },     
    'E598'  => { name     => 'Synthetic calcium aluminates' },
    'E599'  => { name     => 'Perlite' }
};

Readonly my $FLAVOUR_ENHANCERS => 
{
    'E620'  => { name     => 'Glutamic acid',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               } ,
    'E621'  => { name     => 'Monosodium glutamate(MSG)',
                 purpose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E622'  => { name     => 'Monopotassium glutamate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E623'  => { name     => 'Calcium diglutamate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E624'  => { name     => 'Monoammonium glutamate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E625'  => { name     => 'Magnesium diglutamate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },     
    'E626'  => { name     => 'Guanylic acid',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E627'  => { name     => 'Disodium guanylate, sodium guanylate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E628'  => { name     => 'Dipotassium guanylate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E629'  => { name     => 'Calcium guanylate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E630'  => { name     => 'Inosinic acid',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E631'  => { name     => 'Disodium inosinate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E632'  => { name     => 'Dipotassium inosinate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E633'  => { name     => 'Calcium inosinate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E634'  => { name     => 'Calcium 5-ribonucleotides',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E635'  => { name     => 'Disodium 5-ribonucleotides',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E636'  => { name     => 'Maltol',
                 puspose  => 'Flavour enhancer'
               },
    'E637'  => { name     => 'Ethyl maltol',
                 puspose  => 'Flavour enhancer'
               },
    'E640'  => { name     => 'Glycine and its sodium salt',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               },
    'E641'  => { name     => 'L-leucine',
                 puspose  => 'Flavour enhancer'
               },
    'E642'  => { name     => 'Lysine hydrochloride',
                 puspose  => 'Flavour enhancer'
               },
    'E650'  => { name     => 'Zinc acetate',
                 puspose  => 'Flavour enhancer',
                 approved => ['EU']
               }
};

Readonly my $ANTIBIOTICS =>
{
    'E700'    => { name => 'Bacitracin'              },
    'E701'    => { name => 'Tetracyclines'           },
    'E702'    => { name => 'Chlortetracycline'       },
    'E703'    => { name => 'Oxytetracycline'         },
    'E704'    => { name => 'Oleandomycin'            },
    'E705'    => { name => 'Penicillin-G-potassium'  },
    'E706'    => { name => 'Penicillin-G-sodium'     },
    'E707'    => { name => 'Penicillin-G-procaine'   },
    'E708'    => { name => 'Penicillin-G-benzathyne' },
    'E710'    => { name => 'Spiramycins'             },
    'E711'    => { name => 'Virginiamicins'          },
    'E712'    => { name => 'Flavophospholipol'       },
    'E713'    => { name => 'Tylosin'                 },
    'E714'    => { name => 'Monensin'                },
    'E715'    => { name => 'Avoparcin'               },
    'E716'    => { name => 'Salinomycin'             },
    'E717'    => { name => 'Avilamycin'              }
};

Readonly my $MISCELLANEOUS =>
{
    'E900'  => { name     => 'Dimethyl polysiloxane (anti-foaming agent)',
                 purpose  => 'Anti-caking agent',
                 approved => ['EU']
               },  
    'E901'  => { name     => 'Beeswax , white and yellow',
                 purpose  => 'Glazing agent',
                 approved => ['EU']
               },  
    'E902'  => { name     => 'Candelilla wax',
                 purpose  => 'Glazing agent',
                 approved => ['EU']
               },
    'E903'  => { name     => 'Carnauba wax',
                 purpose  => 'Glazing agent',
                 approved => ['EU']
               },  
    'E904'  => { name     => 'Shellac',     
                 purpose  => 'Glazing agent',
                 approved => ['EU']
               },  
    'E905'  => { name     => 'Paraffins',
                 approved => ['EU']
               }, 
    'E905A' => { name     => 'Mineral oil',
                 purpose  => 'Anti-foaming agent'
               },
    'E905B' => { name     => 'Petrolatum' },
    'E905C' => { name     => 'Petroleum wax (i)Microcrystalline wax (ii) Paraffin wax',
                 purpose  => 'Glazing agent',
               },
    'E906'  => { name     => 'Gum benzoic',
                 purpose  => 'Flavour enhancer'
               },
    'E907'  => { name     => 'Crystalline wax',
                 purpose  => 'Glazing agent'
               },  
    'E908'  => { name     => 'Rice bran wax',
                 purpose  => 'Glazing agent'
               },
    'E909'  => { name     => 'Spermaceti wax',
                 purpose  => 'Glazing agent',
               },
    'E910'  => { name     => 'Wax esters',
                 purpose  => 'Glazing agent',
               },
    'E911'  => { name     => 'Methyl esters of fatty acids',
                 purpose  => 'Glazing agent',
               },  
    'E912'  => { name     => 'Montan acid esters',
                 purpose  => 'Glazing agent',
                 approved => ['EU']
               },  
    'E913'  => { name     => 'Lanolin, sheep wool grease',
                 purpose  => 'Glazing agent',
               },
    'E914'  => { name     => 'Oxidized polyethylene wax',
                 purpose  => 'Glazing agent',
                 approved => ['EU']
               },  
    'E915'  => { name     => 'Esters of colophony',
                 purpose  => 'Glazing agent',
               },
    'E916'  => { name     => 'Calcium iodate'    },
    'E917'  => { name     => 'Potassium iodate'  },        
    'E918'  => { name     => 'Nitrogen oxides'   },         
    'E919'  => { name     => 'Nitrosyl chloride' },    
    'E920'  => { name     => 'L-cysteine',
                 purpose  => 'Improving agent',
                 approved => ['EU']
               },
    'E921'  => { name     => 'L-cystine',
                 purpose  => 'Improving agent',
               },  
    'E922'  => { name     => 'Potassium persulphate',
                 purpose  => 'Improving agent'
               },
    'E923'  => { name     => 'Ammonium persulphate',
                 purpose  => 'Improving agent',
               },  
    'E924'  => { name     => 'Potassium bromate',
                 purpose  => 'Improving agent',
               },  
    'E924B' => { name     => 'Calcium bromate',
                 purpose  => 'Improving agent',
               },  
    'E925'  => { name     => 'Chlorine',
                 purpose  => 'Preservative, bleach, improving agent',
               },
    'E926'  => { name     => 'Chlorine dioxide (preservative)',
                 purpose  => 'Bleach'
               },
    'E927A' => { name     => 'Azodicarbonamide',
                 purpose  => 'Improving agent'
               },
    'E927B' => { name     => 'Carbamide (urea)',
                 purpose  => 'Improving agent',
                 approved => ['EU']
               },  
    'E928'  => { name     => 'Benzoyl peroxide (improving agent)',
                 purpose  => 'Bleach'
               },  
    'E929'  => { name     => 'Acetone peroxide' },
    'E930'  => { name     => 'Calcium peroxide (improving agent)',
                 purpose  => 'Bleach'
               },  
    'E938'  => { name     => 'Argon',
                 purpose  => 'Packaging gas',
                 approved => ['EU']
               },  
    'E939'  => { name     => 'Helium',
                 purpose  => 'Packaging gas',
                 approved => ['EU']
               },  
    'E940'  => { name     => 'Dichlorodifluoromethane',
                 purpose  => 'Packaging gas',
               },
    'E941'  => { name     => 'Nitrogen (packaging gas)',
                 purpose  => 'Propellant',
                 approved => ['EU']
               },
    'E942'  => { name     => 'Nitrous oxide',
                 purpose  => 'Propellant',
                 approved => ['EU']
               },  
    'E943A' => { name     => 'Butane',
                 purpose  => 'Propellant',
                 approved => ['EU']
               },  
    'E943B' => { name     => 'Isobutane',
                 purpose  => 'Propellant',
                 approved => ['EU']
               },  
    'E944'  => { name     => 'Propane',
                 purpose  => 'Propellant',
                 approved => ['EU']
               },  
    'E945'  => { name     => 'Chloropentafluoroethane',
                 purpose  => 'Propellant'
               },  
    'E946'  => { name     => 'Octafluorocyclobutane',
                 purpose  => 'Propellant',
               },  
    'E948'  => { name     => 'Oxygen',
                 purpose  => 'Packaging gas',
                 approved => ['EU']
               },   
    'E949'  => { name     => 'Hydrogen',
                 purpose  => 'Packaging gas',
                 approved => ['EU']
               },  
    'E950'  => { name     => 'Acesulfame potassium',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },  
    'E951'  => { name     => 'Aspartame',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },  
    'E952'  => { name     => 'Cyclamic acid and its sodium and calcium salts, also known as Cyclamate',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },  
    'E953'  => { name     => 'Isomalt, Isomaltitol',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },  
    'E954'  => { name     => 'Saccharin and its sodium, potassium and calcium salts',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               }, 
    'E955'  => { name     => 'Sucralose (Trichlorogalactosucrose)',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },  
    'E956'  => { name     => 'Alitame',
                 purpose  => 'Sweetener',
               },
    'E957'  => { name     => 'Thaumatin (sweetener)',
                 purpose  => 'Flavour enhancer',
                 approved => ['EU']
               },  
    'E958'  => { name     => 'Glycyrrhizin (sweetener)',
                 purpose  => 'Flavour enhancer'
               },  
    'E959'  => { name     => 'Neohesperidine dihydrochalcone (sweetener)',
                 purpose  => 'Flavour enhancer',
                 approved => ['EU']
               },  
    'E960'  => { name     => 'Stevioside',
                 purpose  => 'Sweetener'
               },  
    'E961'  => { name     => 'Neotame',
                   purpose  => 'Sweetener'
                 },  
    'E962'  => { name     => 'Aspartame-acesulfame salt (sweetener)',
                 purpose  => 'Stabiliser',
                 approved => ['EU']
               },  
    'E965'  => { name     => 'Maltitol (i) Maltitol (ii) Maltitol syrup (sweetener) (stabiliser)',
                 purpose  => 'Humectant',
                 approved => ['EU']
               },  
    'E966'  => { name     => 'Lactitol',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },  
    'E967'  => { name     => 'Xylitol',
                 purpose  => 'Sweetener',
                 approved => ['EU']
               },  
    'E968'  => { name     => 'Erythritol',
                 purpose  => 'Humectant',
                 approved => ['EU']
               },  
    'E999'  => { name     => 'Quillaia extract',
                 purpose  => 'Foaming agent',
                 approved => ['EU']
               }  
};

Readonly my $ADDITIONAL_CHEMICALS =>
{
    'E1000' => { name     => 'Cholic acid',
                 purpose  => 'Emulsifier'
               },
    'E1001' => { name     => 'Choline salts',
                 purpose  => 'Emulsifier'
               },
    'E1100' => { name     => 'Amylase',
                 purpose  => 'Stabiliser, flavour enhancer'
               },
    'E1101' => { name     => 'Proteases ((i)Protease, (ii)Papain, (iii)Bromelain, (iv)Ficin)',
                 purpose  => 'Stabiliser, flavour enhancer'
               },
    'E1102' => { name     => 'Glucose oxidase',
                 purpose  => 'Antioxidant'
               },
    'E1103' => { name     => 'Invertase',
                 purpose  => 'Stabiliser',
                 approved => ['EU']
               },
    'E1104' => { name     => 'Lipases' },
    'E1105' => { name     => 'Lysozyme',
                 purpose  => 'Preservative'
               },
    'E1200' => { name     => 'Polydextrose',
                 purpose  => 'Stabiliser, thickening agent, humectant, carrier',
                 approved => ['EU']
               },
    'E1201' => { name     => 'Polyvinylpyrrolidone',
                 purpose  => 'Stabiliser',
                 approved => ['EU']
               },
    'E1202' => { name     => 'Polyvinylpolypyrrolidone (carrier)',
                 purpose  => 'Stabiliser',
                 approved => ['EU']
               },
    'E1203' => { name     => 'Polyvinyl alcohol',
                 approved => ['EU']
               },
    'E1204' => { name     => 'Pullulan',
                 approved => ['EU']
               },
    'E1400' => { name     => 'Dextrin (Dextrins, roasted starch white and yellow) (stabiliser)',
                 purpose  => 'Thickening agent'
               },
    'E1401' => { name     => 'Modified starch ((Acid-treated starch) stabiliser)',
                 purpose  => 'Thickening agent'
               },
    'E1402' => { name     => 'Alkaline modified starch (stabiliser)',
                 purpose  => 'Thickening agent'
               },
    'E1403' => { name     => 'Bleached starch (stabiliser)',
                 purpose  => 'Thickening agent'
               },
    'E1404' => { name     => 'Oxidized starch (emulsifier)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1405' => { name     => 'Enzyme treated starch' },
    'E1410' => { name     => 'Monostarch phosphate (stabiliser)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1411' => { name     => 'Distarch glycerol (thickening agent)',
                 purpose  => 'Emulsifier'
               },
    'E1412' => { name     => 'Distarch phosphate esterified with sodium trimetasphosphate; esterified with phosphorus oxychloride (stabiliser)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1413' => { name     => 'Phosphated distarch phosphate (stabiliser)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1414' => { name     => 'Acetylated distarch phosphate (emulsifier)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1420' => { name     => 'Starch acetate esterified with acetic anhydride (stabiliser)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1421' => { name     => 'Starch acetate esterified with vinyl acetate (stabiliser)',
                 purpose  => 'Thickening agent',
               },
    'E1422' => { name     => 'Acetylated Distarch Adipate (stabiliser)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1423' => { name     => 'Acetylated distarch glycerol',
                 purpose  => 'Thickening agent'
               },
    'E1430' => { name     => 'Distarch glycerine (stabiliser)',
                 purpose  => 'Thickening agent'
               },
    'E1440' => { name     => 'Hydroxy propyl starch (emulsifier)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1441' => { name     => 'Hydroxy propyl distarch glycerine (stabiliser)',
                 purpose  => 'Thickening agent'
               },
    'E1442' => { name     => 'Hydroxy propyl distarch phosphate (stabiliser)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1443' => { name     => 'Hydroxy propyl distarch glycerol' },
    'E1450' => { name     => 'Starch sodium octenyl succinate (emulsifier) (stabiliser)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1451' => { name     => 'Acetylated oxidised starch (emulsifier)',
                 purpose  => 'Thickening agent',
                 approved => ['EU']
               },
    'E1452' => { name     => 'Starch aluminium octenyl succinate',
                 approved => ['EU']
               },
    'E1501' => { name     => 'Benzylated hydrocarbons' },
    'E1502' => { name     => 'Butane-1, 3-diol'        },
    'E1503' => { name     => 'Castor oil',
                 purpose  => 'Resolving agent'
               },
    'E1504' => { name     => 'Ethyl acetate',
                 purpose  => 'Flavour solvent',
               },
    'E1505' => { name     => 'Triethyl citrate',
                 purpose  => 'Foam stabiliser',
                 approved => ['EU']
               },
    'E1510' => { name     => 'Ethanol' },
    'E1516' => { name     => 'Glyceryl monoacetate',
                 purpose  => 'Flavour solvent',
               },
    'E1517' => { name     => 'Glyceryl diacetate or diacetin',
                 purpose  => 'Flavour solvent',
               },
    'E1518' => { name     => 'Glyceryl triacetate or triacetin',
                 purpose  => 'Humectant',
                 approved => ['EU']
               },
    'E1519' => { name     => 'Benzyl alcohol' },
    'E1520' => { name     => 'Propylene glycol',
                 purpose  => 'Humectant',
                 approved => ['EU']
               },
    'E1521' => { name     => 'Polyethylene glycol 8000',
                 approved => ['EU']
               },
    'E1525' => { name     => 'Hydroxyethyl cellulose',
                 purpose  => 'Thickening agent'
               }
};

Readonly my $HALAL =>
[
    'E100',  'E101',  'E101A', 'E102',  'E103',  'E104',  'E105',  'E106',  'E107',
    'E110',  'E1103', 'E1105', 'E1200', 'E1201', 'E1202', 'E122',  'E123',  'E124',
    'E127',  'E128',  'E129',  'E131',  'E132',  'E133',  'E140',  'E1400', 'E1401',
    'E1402', 'E1403', 'E1404', 'E141',  'E1410', 'E1412', 'E1413', 'E1414', 'E142',
    'E1420', 'E1421', 'E1422', 'E1440', 'E1441', 'E1442', 'E1450', 'E1501', 'E1502',
    'E1503', 'E1504', 'E1505', 'E150A', 'E150B', 'E150C', 'E150D', 'E151',  'E1517',
    'E1518', 'E1520', 'E153',  'E154',  'E155',  'E160B', 'E160C', 'E160D', 'E160E',
    'E160F', 'E161A', 'E161B', 'E161C', 'E161D', 'E161E', 'E161F', 'E161G', 'E162',
    'E163',  'E170',  'E171',  'E172',  'E173',  'E174',  'E175',  'E180',  'E200',
    'E201',  'E202',  'E203',  'E210',  'E211',  'E212',  'E213',  'E214',  'E215',
    'E216',  'E217',  'E218',  'E219',  'E220',  'E221',  'E222',  'E223',  'E224',
    'E225',  'E226',  'E227',  'E228',  'E230',  'E231',  'E232',  'E233',  'E234',
    'E235',  'E236',  'E237',  'E238',  'E239',  'E240',  'E242',  'E249',  'E250',
    'E251',  'E260',  'E261',  'E262',  'E263',  'E264',  'E280',  'E281',  'E282',
    'E283',  'E284',  'E285',  'E290',  'E296',  'E297',  'E300',  'E301',  'E302',
    'E303',  'E306',  'E307',  'E308',  'E309',  'E310',  'E311',  'E313',  'E314',
    'E315',  'E320',  'E321',  'E330',  'E331',  'E332',  'E333',  'E334',  'E335',
    'E336',  'E337',  'E338',  'E339',  'E340',  'E341',  'E343',  'E350',  'E351',
    'E352',  'E353',  'E354',  'E355',  'E356',  'E357',  'E363',  'E365',  'E366',
    'E367',  'E370',  'E375',  'E380',  'E381',  'E385',  'E400',  'E401',  'E402',
    'E403',  'E404',  'E405',  'E406',  'E407',  'E407A', 'E410',  'E412',  'E413',
    'E414',  'E415',  'E416',  'E417',  'E418',  'E420',  'E421',  'E422',  'E425',
    'E440',  'E444',  'E450',  'E451',  'E452',  'E460',  'E461',  'E462',  'E463',
    'E464',  'E465',  'E466',  'E467',  'E469',  'E476',  'E500',  'E501',  'E503',
    'E504',  'E507',  'E508',  'E509',  'E510',  'E511',  'E512',  'E513',  'E514',
    'E515',  'E516',  'E517',  'E518',  'E519',  'E520',  'E521',  'E522',  'E523',
    'E524',  'E525',  'E526',  'E527',  'E528',  'E529',  'E530',  'E535',  'E536',
    'E538',  'E541',  'E543',  'E544',  'E545',  'E546',  'E550',  'E551',  'E552',
    'E553A', 'E553B', 'E554',  'E555',  'E556',  'E558',  'E559',  'E574',  'E575',
    'E576',  'E577',  'E578',  'E579',  'E585',  'E620',  'E621',  'E622',  'E623',
    'E624',  'E625',  'E626',  'E627',  'E628',  'E629',  'E900',  'E901',  'E902',
    'E903',  'E905',  'E907',  'E912',  'E913',  'E915',  'E925',  'E926',  'E927A',
    'E927B', 'E928',  'E930',  'E938',  'E939',  'E941',  'E942',  'E948',  'E950',
    'E951',  'E952',  'E953',  'E954',  'E957',  'E959',  'E965',  'E966',  'E967',
    'E999'
];

Readonly my $HARAM =>
[
    'E120',  'E441',  'E542',  'E904',  'E920',  'E921'
];

Readonly my $SUSPECTED =>
[
    'E111',  'E121',  'E125',  'E126',  'E130',  'E152',  'E160A', 'E252',  'E270',
    'E304',  'E312',  'E316',  'E318',  'E322',  'E325',  'E326',  'E327',  'E329',
    'E430',  'E431',  'E432',  'E433',  'E434',  'E435',  'E436',  'E442',  'E445',
    'E470A', 'E470B', 'E471',  'E472A', 'E472B', 'E472C', 'E472D', 'E472E', 'E472F',
    'E473',  'E474',  'E475',  'E477',  'E478',  'E479B', 'E481',  'E482',  'E483',
    'E491',  'E492',  'E493',  'E494',  'E495',  'E570',  'E571',  'E572',  'E910'
];

Readonly my $NONVEG =>
{
    'E120'  => 'Colour isolated from the insects Coccus cacti',
    'E322'  => 'Soy beans and for some purposes from chicken eggs.',
    'E430'  => 'Polyoxyethylene(8) stearate. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E431'  => 'Polyoxyethylene (40) stearate. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E432'  => 'Polyoxyethylene-20-sorbitan monolaurate. Lauric acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E433'  => 'Polyoxyethylene-20-sorbitan mono-oleate. Oleic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E434'  => 'Polyoxyethylene-20-sorbitan monopalmitate. Palmitic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E435'  => 'Polyoxyethylene-20-sorbitan monostearate. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E436'  => 'Polyoxyethylene-20-sorbitan tristearate. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E441'  => 'Gelatine (emulsifier)',
    'E470'  => 'Fatty acid salts. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E471'  => 'Mono- and di-glycerides of fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E472'  => 'Esters of mono- and diglycerides. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E473'  => 'Sugar esters of fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E474'  => 'Combination of sugar and fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E475'  => 'Polyglycerol esters of fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E477'  => 'Propyleneglycol esters of fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E478'  => 'Mixture of glycerol- and propyleneglycol esters of lactic acid and fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E479'  => 'Esterified soy oil. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E479B' => 'Esterified soy oil. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E481'  => 'Mixture of lactic acid and stearic acid, a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E482'  => 'Mixture of lactic acid and stearic acid, a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E483'  => 'Mixture of tartaric acid and stearic acid, a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E484'  => 'Mixture of citric acid and stearic acid, a fatty acid. Fatty acid are normally of plant origin, but animal origin cannot be excluded.',
    'E491'  => 'Combinations of sorbitol and fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E492'  => 'Combinations of sorbitol and fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E493'  => 'Combinations of sorbitol and fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E494'  => 'Combinations of sorbitol and fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E495'  => 'Combinations of sorbitol and fatty acids. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E542'  => 'From animal bones. Since the BSE crisis mainly from pork, but other animal bones are used.',
    'E570'  => 'Stearic acid and stearates. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E571'  => 'Stearic acid and stearates. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E572'  => 'Stearic acid and stearates. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E573'  => 'Stearic acid and stearates. Stearic acid is a fatty acid. Fatty Acids are normally of plant origin, but animal origin cannot be excluded.',
    'E626'  => 'Mainly from yeast, also from sardines and meat.',
    'E627'  => 'Mainly from yeast, also from sardines and meat.',
    'E628'  => 'Mainly from yeast, also from sardines and meat.',
    'E629'  => 'Mainly from yeast, also from sardines and meat.',
    'E630'  => 'Mainly from meat and fish, also made with bacteria.',
    'E631'  => 'Mainly from meat and fish, also made with bacteria.',
    'E632'  => 'Mainly from meat and fish, also made with bacteria.',
    'E633'  => 'Mainly from meat and fish, also made with bacteria.',
    'E634'  => 'Mainly from meat and fish, also made with bacteria.',
    'E635'  => 'Mainly from meat and fish, also made with bacteria.',
    'E636'  => 'rom malt (barley), sometimes also from heating milk sugar.',
    'E637'  => 'rom malt (barley), sometimes also from heating milk sugar.',
    'E640'  => 'Mainly from gelatine (see 441 above), also synthetically.',
    'E901'  => 'Made by bees, but does not contain insects.',
    'E904'  => 'Natural polymer derived from certain species of lice from India. Insects get trapped in the resin.',
    'E913'  => 'A wax from sheep. It is excreted by the skin of the sheep and extracted from the wool.',
    'E920'  => 'erived from proteins, including animal protein and hair.',
    'E921'  => 'erived from proteins, including animal protein and hair.',
    'E966'  => 'Made from milk sugar',
    'E1000' => 'From beef (bile)',
    'E1105' => 'From chicken eggs'
};

=head1 DESCRIPTION

E  numbers  are  number  codes  for  food additives that have been assessed for use within the
European Union (the "E" prefix stands for "Europe"). They  are  commonly  found on food labels
throughout  the  European  Union. Safety assessment and approval are the responsibility of the 
European Food Safety Authority.

The  numbering  scheme  follows that of the International Numbering System (INS) as determined
by the Codex Alimentarius committee  though  only  a  subset of the INS additives are approved
for  use  in  the  European  Union. E  numbers are also encountered on food labelling in other 
jurisdictions,  including  the Cooperation Council for the Arab States of the Gulf, Australia, 
New Zealand  and  Israel.  The  "E"  prefix  is omitted in Australia and New Zealand. They are
increasingly, though rarely found on North American packaging especially in Canada on imported 
European products.

=cut

Readonly my $CLASSIFICATION =>
[
    { category => 'Colours', 
      data     => $COLOURS, 
      min      => 100, 
      max      => 199 
    },
    { category => 'Preservatives', 
      data     => $PRESERVATIVES, 
      min      => 200, 
      max      => 299 
    },
    { category => 'Antioxidants, Acidity Regulators',
      data     => $ANTIOXIDANTS_ACIDITY_REGULATORS,
      min      => 300, 
      max      => 399 
    },
    { category => 'Thickeners, Stablisers, Emulsifiers',
      data     => $THICKENERS_STABLISERS_EMULSIFIERS,
      min      => 400, 
      max      => 499 
    },
    { category => 'PH Regulators, Anti-caking Agents',
      data     => $PH_REGULATORS_ANTI_CAKING_AGENTS,
      min      => 500, 
      max      => 599 
    },
    { category => 'Flavour Enhancers',
      data     => $FLAVOUR_ENHANCERS,
       min      => 600, 
      max      => 699 
    },
    { category => 'Antibiotics',
      data     => $ANTIBIOTICS,
      min      => 700, 
      max      => 799 
    },
    { category => 'Miscellaneous',
      data     => $MISCELLANEOUS,
      min      => 900, 
      max      => 999 
    },
    { category => 'Additional Chemicals',
      data     => $ADDITIONAL_CHEMICALS,
      min      => 1100,
      max      => 1599
    }  
];

sub new
{
    my $class = shift;
    my $self  = { };
    $self->{ classification } = $CLASSIFICATION;
    bless $self, $class;
    return $self;
}

=head1 METHODS

=head2 is_valid()

Return 1/0 depending whether the given Ecode is VALID or INVALID.

    use strict; use warnings;
    use Food::ECodes;
    
    my $food = Food::ECodes->new();
    print "E100 is a valid ECode.\n" if $food->is_valid('E100');

=cut

sub is_valid
{
    my $self = shift;
    my $code = shift;
    
    $code = uc($code);
    $code =~ /(\d+)/;
    my $number = $1;
    foreach (@{$self->{classification}})
    {
        if (($number <= $_->{max}) && ($number >= $_->{min}))
        {
            return 1 if exists($_->{data}->{$code});
        }
    }
    return 0;
}

=head2 get_status()

Return status of the given Ecode. Possible values are HALAL,HARAM or SUSPECTED. Returns N/A if
the code doesn't have status in our record.

    use strict; use warnings;
    use Food::ECodes;
    
    my $food   = Food::ECodes->new();
    my $status = $food->get_status('E100');
    print "Status for ECode E100: [$status].\n";

=cut

sub get_status
{
    my $self = shift;
    my $code = shift;
    
    $code = uc($code);
    return 'HALAL'     if grep(/\b$code\b/, @{$HALAL});
    return 'HARAM'     if grep(/\b$code\b/, @{$HARAM});
    return 'SUSPECTED' if grep(/\b$code\b/, @{$SUSPECTED});
    return 'N/A';    
}

=head2 get_name()

Return the name of the given Ecode, if exists, otherwise croaks.

    use strict; use warnings;
    use Food::ECodes;
    
    my $food = Food::ECodes->new();
    my $name = $food->get_name('E100');
    print "Name for ECode E100: [$name].\n";

=cut

sub get_name
{
    my $self = shift;
    my $code = shift;
    
    $code = uc($code);
    $code =~ /(\d+)/;
    my $number = $1;
    foreach (@{$self->{classification}})
    {
        if (($number <= $_->{max}) && ($number >= $_->{min}))
        {
            croak("ERROR: Invalid ECode [$code].\n")
                unless exists($_->{data}->{$code}->{name});
            return $_->{data}->{$code}->{name};
        }
    }
}

=head2 get_purpose()

Return the purpose of the given Ecode, if exists.

    use strict; use warnings;
    use Food::ECodes;
    
    my $food    = Food::ECodes->new();
    my $purpose = $food->get_purpose('E100');
    print "Purpose for ECode E100: [$purpose].\n";

=cut

sub get_purpose
{
    my $self = shift;
    my $code = shift;
    
    $code = uc($code);
    $code =~ /(\d+)/;
    my $number = $1;
    foreach (@{$self->{classification}})
    {
        if (($number <= $_->{max}) && ($number >= $_->{min}))
        {
            return 'N/A'
                unless exists($_->{data}->{$code}->{purpose});
            return $_->{data}->{$code}->{purpose};
        }
    }
}

=head2 is_eu_approved()

Return 1/0 depending whether the given Ecode is approved in EU.

    use strict; use warnings;
    use Food::ECodes;
    
    my $food = Food::ECodes->new();
    print "E100 is EU approved code.\n" if $food->is_eu_approved('E100');

=cut

sub is_eu_approved
{
    my $self = shift;
    my $code = shift;
    
    $code = uc($code);
    $code =~ /(\d+)/;
    my $number = $1;
    foreach (@{$self->{classification}})
    {
        if (($number <= $_->{max}) && ($number >= $_->{min}))
        {
            return 1
                if (exists($_->{data}->{$code}->{approved})
                    &&
                    (grep(/EU/, @{$_->{data}->{$code}->{approved}})));
            return 0;
        }
    }
}

=head2 is_us_approved()

Return 1/0 depending whether the given Ecode is approved in US.

    use strict; use warnings;
    use Food::ECodes;
    
    my $food = Food::ECodes->new();
    print "E100 is US approved code.\n" if $food->is_us_approved('E100');

=cut

sub is_us_approved
{
    my $self = shift;
    my $code = shift;
    
    $code = uc($code);
    $code =~ /(\d+)/;
    my $number = $1;
    foreach (@{$self->{classification}})
    {
        if (($number <= $_->{max}) && ($number >= $_->{min}))
        {
            return 1
                if (exists($_->{data}->{$code}->{approved})
                    &&
                    (grep(/US/, @{$_->{data}->{$code}->{approved}})));
            return 0;
        }
    }
}

=head2 is_vegetarian()

Return 1/0 depending whether the given Ecode is VEGETARIAN or NOT.

    use strict; use warnings;
    use Food::ECodes;
    
    my $food = Food::ECodes->new();
    print "E100 is VEGETARIAN.\n" if $food->is_vegetarian('E100');
    print "E120 is NON-VEGETARIAN.\n" unless $food->is_vegetarian('E120');

=cut

sub is_vegetarian
{
    my $self = shift;
    my $code = shift;
    
    $code = uc($code);
    return 0 if exists($NONVEG->{$code});
    return 1;
}

=head1 AUTHOR

Mohammad S Anwar, C<< <mohammad.anwar at yahoo.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-food-ecodes at rt.cpan.org> or through the
web  interface  at  L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Food-ECodes>.  I  will be 
notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Food::ECodes

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Food-ECodes>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Food-ECodes>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Food-ECodes>

=item * Search CPAN

L<http://search.cpan.org/dist/Food-ECodes/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Mohammad S Anwar.

This  program  is  free software; you can redistribute it and/or modify it under the  terms of
either:  the  GNU  General Public License as published by the Free Software Foundation; or the 
Artistic License.

See http://dev.perl.org/licenses/ for more information.

=head1 DISCLAIMER

This  program  is  distributed  in  the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut

1; # End of Food::ECodes