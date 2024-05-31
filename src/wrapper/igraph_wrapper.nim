
const
  Igraphsimplesw* = cuint(0)
const
  Igraphloopssw* = cuint(1)
const
  Igraphmultisw* = cuint(6)
const
  Igraphwritegmldefaultsw* = cuint(0)
const
  Igraphwritegmlencodeonlyquotsw* = cuint(1)
type
  enumigrapherrortypet* {.size: sizeof(cuint).} = enum
    Igraphsuccess = 0, Igraphfailure = 1, Igraphenomem = 2,
    Igraphparseerror = 3, Igrapheinval = 4, Igraphexists = 5,
    Igrapheinvevector = 6, Igrapheinvvid = 7, Igraphnonsquare = 8,
    Igrapheinvmode = 9, Igraphefile = 10, Igraphunimplemented = 12,
    Igraphinterrupted = 13, Igraphdiverged = 14, Igrapharpackprod = 15,
    Igrapharpacknpos = 16, Igrapharpacknevnpos = 17, Igrapharpackncvsmall = 18,
    Igrapharpacknonposi = 19, Igrapharpackwhichinv = 20,
    Igrapharpackbmatinv = 21, Igrapharpackworklsmall = 22,
    Igrapharpacktriderr = 23, Igrapharpackzerostart = 24,
    Igrapharpackmodeinv = 25, Igrapharpackmodebmat = 26,
    Igrapharpackishift = 27, Igrapharpacknevbe = 28, Igrapharpacknofact = 29,
    Igrapharpackfailed = 30, Igrapharpackhowmny = 31, Igrapharpackhowmnys = 32,
    Igrapharpackevdiff = 33, Igrapharpackshur = 34, Igrapharpacklapack = 35,
    Igrapharpackunknown = 36, Igraphenegloop = 37, Igrapheinternal = 38,
    Igrapharpackmaxit = 39, Igrapharpacknoshift = 40, Igrapharpackreorder = 41,
    Igraphedivzero = 42, Igraphglpebound = 43, Igraphglperoot = 44,
    Igraphglpenopfs = 45, Igraphglpenodfs = 46, Igraphglpefail = 47,
    Igraphglpemipgap = 48, Igraphglpetmlim = 49, Igraphglpestop = 50,
    Igrapheattributes = 51, Igrapheattrcombine = 52, Igraphelapack = 53,
    Igraphedrl = 54, Igrapheoverflow = 55, Igrapheglp = 56, Igraphcputime = 57,
    Igrapheunderflow = 58, Igrapherwstuck = 59, Igraphstop = 60,
    Igrapherange = 61, Igraphenosol = 62
type
  enumigraphidirectedt* {.size: sizeof(cuint).} = enum
    Igraphundirected = 0, Igraphdirected = 1
type
  enumigraphloopst* {.size: sizeof(cuint).} = enum
    Igraphnoloops = 0, Igraphloops = 1, Igraphloopsonce = 2
const
  Igraphloopstwice* = enumigraphloopst.Igraphloops
type
  enumigraphmultiplet* {.size: sizeof(cuint).} = enum
    Igraphnomultiple = 0, Igraphmultiple = 1
type
  enumigraphordert* {.size: sizeof(cuint).} = enum
    Igraphascending = 0, Igraphdescending = 1
type
  enumigraphoptimalt* {.size: sizeof(cuint).} = enum
    Igraphminimum = 0, Igraphmaximum = 1
type
  enumigraphneimodet* {.size: sizeof(cuint).} = enum
    Igraphout = 1, Igraphin = 2, Igraphall = 3
type
  enumigraphconnectednesst* {.size: sizeof(cuint).} = enum
    Igraphweak = 1, Igraphstrong = 2
type
  enumigraphreciprocityt* {.size: sizeof(cuint).} = enum
    Igraphreciprocitydefault = 0, Igraphreciprocityratio = 1
type
  enumigraphadjacencyt* {.size: sizeof(cuint).} = enum
    Igraphadjdirected = 0, Igraphadjundirected = 1, Igraphadjupper = 2,
    Igraphadjlower = 3, Igraphadjmin = 4, Igraphadjplus = 5, Igraphadjmax = 6
type
  enumigraphstarmodet* {.size: sizeof(cuint).} = enum
    Igraphstarout = 0, Igraphstarin = 1, Igraphstarundirected = 2,
    Igraphstarmutual = 3
type
  enumigraphwheelmodet* {.size: sizeof(cuint).} = enum
    Igraphwheelout = 0, Igraphwheelin = 1, Igraphwheelundirected = 2,
    Igraphwheelmutual = 3
type
  enumigraphtreemodet* {.size: sizeof(cuint).} = enum
    Igraphtreeout = 0, Igraphtreein = 1, Igraphtreeundirected = 2
type
  enumigrapherdosrenyit* {.size: sizeof(cuint).} = enum
    Igrapherdosrenyignp = 0, Igrapherdosrenyignm = 1
type
  enumigraphgetadjacencyt* {.size: sizeof(cuint).} = enum
    Igraphgetadjacencyupper = 0, Igraphgetadjacencylower = 1,
    Igraphgetadjacencyboth = 2
type
  enumigraphdegseqt* {.size: sizeof(cuint).} = enum
    Igraphdegseqconfiguration = 0, Igraphdegseqvl = 1,
    Igraphdegseqfastheursimple = 2, Igraphdegseqconfigurationsimple = 3,
    Igraphdegseqedgeswitchingsimple = 4
const
  Igraphdegseqsimple* = enumigraphdegseqt.Igraphdegseqconfiguration
const
  Igraphdegseqsimplenomultiple* = enumigraphdegseqt.Igraphdegseqfastheursimple
const
  Igraphdegseqsimplenomultipleuniform* = enumigraphdegseqt.Igraphdegseqconfigurationsimple
type
  enumigraphrealizedegseqt* {.size: sizeof(cuint).} = enum
    Igraphrealizedegseqsmallest = 0, Igraphrealizedegseqlargest = 1,
    Igraphrealizedegseqindex = 2
type
  enumigraphrandomtreet* {.size: sizeof(cuint).} = enum
    Igraphrandomtreeprufer = 0, Igraphrandomtreelerw = 1
type
  enumigraphfileformattypet* {.size: sizeof(cuint).} = enum
    Igraphfileformatedgelist = 0, Igraphfileformatncol = 1,
    Igraphfileformatpajek = 2, Igraphfileformatlgl = 3,
    Igraphfileformatgraphml = 4
type
  enumigraphrewiringt* {.size: sizeof(cuint).} = enum
    Igraphrewiringsimple = 0, Igraphrewiringsimpleloops = 1
type
  enumigraphedgeordertypet* {.size: sizeof(cuint).} = enum
    Igraphedgeorderid = 0, Igraphedgeorderfrom = 1, Igraphedgeorderto = 2
type
  enumigraphtodirectedt* {.size: sizeof(cuint).} = enum
    Igraphtodirectedarbitrary = 0, Igraphtodirectedmutual = 1,
    Igraphtodirectedrandom = 2, Igraphtodirectedacyclic = 3
type
  enumigraphtoundirectedt* {.size: sizeof(cuint).} = enum
    Igraphtoundirectedeach = 0, Igraphtoundirectedcollapse = 1,
    Igraphtoundirectedmutual = 2
type
  enumigraphvconnneit* {.size: sizeof(cuint).} = enum
    Igraphvconnneierror = 0, Igraphvconnneinumberofnodes = 1,
    Igraphvconnneiignore = 2, Igraphvconnneinegative = 3
type
  enumigraphspincommupdatet* {.size: sizeof(cuint).} = enum
    Igraphspincommupdatesimple = 0, Igraphspincommupdateconfig = 1
type
  enumigraphlazyadlistsimplifyt* {.size: sizeof(cuint).} = enum
    Igraphdontsimplify = 0, Igraphsimplify = 1
type
  enumigraphtransitivitymodet* {.size: sizeof(cuint).} = enum
    Igraphtransitivitynan = 0, Igraphtransitivityzero = 1
type
  enumigraphspinglassimplementationt* {.size: sizeof(cuint).} = enum
    Igraphspincommimporig = 0, Igraphspincommimpneg = 1
type
  enumigraphcommunitycomparisont* {.size: sizeof(cuint).} = enum
    Igraphcommcmpvi = 0, Igraphcommcmpnmi = 1, Igraphcommcmpsplitjoin = 2,
    Igraphcommcmprand = 3, Igraphcommcmpadjustedrand = 4
type
  enumigraphaddweightst* {.size: sizeof(cuint).} = enum
    Igraphaddweightsno = 0, Igraphaddweightsyes = 1,
    Igraphaddweightsifpresent = 2
type
  enumigraphbarabasialgorithmt* {.size: sizeof(cuint).} = enum
    Igraphbarabasibag = 0, Igraphbarabasipsumtree = 1,
    Igraphbarabasipsumtreemultiple = 2
type
  enumigraphfasalgorithmt* {.size: sizeof(cuint).} = enum
    Igraphfasexactip = 0, Igraphfasapproxeades = 1
type
  enumigraphsubgraphimplementationt* {.size: sizeof(cuint).} = enum
    Igraphsubgraphauto = 0, Igraphsubgraphcopyanddelete = 1,
    Igraphsubgraphcreatefromscratch = 2
type
  enumigraphimitatealgorithmt* {.size: sizeof(cuint).} = enum
    Igraphimitateaugmented = 0, Igraphimitateblind = 1,
    Igraphimitatecontracted = 2
type
  enumigraphlayoutgridt* {.size: sizeof(cuint).} = enum
    Igraphlayoutgrid = 0, Igraphlayoutnogrid = 1, Igraphlayoutautogrid = 2
type
  enumigraphrandomwalkstuckt* {.size: sizeof(cuint).} = enum
    Igraphrandomwalkstuckerror = 0, Igraphrandomwalkstuckreturn = 1
type
  enumigraphvoronoitiebreakert* {.size: sizeof(cuint).} = enum
    Igraphvoronoifirst = 0, Igraphvoronoilast = 1, Igraphvoronoirandom = 2
type
  enumigraphmatrixstoraget* {.size: sizeof(cuint).} = enum
    Igraphrowmajor = 0, Igraphcolumnmajor = 1
type
  enumigraphcachedpropertyt* {.size: sizeof(cuint).} = enum
    Igraphprophasloop = 0, Igraphprophasmulti = 1, Igraphprophasmutual = 2,
    Igraphpropisweaklyconnected = 3, Igraphpropisstronglyconnected = 4,
    Igraphpropisdag = 5, Igraphpropisforest = 6, Igraphpropisize = 7
type
  enumigraphsparsemattypet* {.size: sizeof(cuint).} = enum
    Igraphsparsemattriplet = 0, Igraphsparsematcc = 1
type
  enumigraphsparsematsolvet* {.size: sizeof(cuint).} = enum
    Igraphsparsematsolvelu = 0, Igraphsparsematsolveqr = 1
type
  enumigraphvstypet* {.size: sizeof(cuint).} = enum
    Igraphvsall = 0, Igraphvsadj = 1, Igraphvsnone = 2, Igraphvs1 = 3,
    Igraphvsvectorptr = 4, Igraphvsvector = 5, Igraphvsrange = 6,
    Igraphvsnonadj = 7
type
  enumigraphvittypet* {.size: sizeof(cuint).} = enum
    Igraphvitrange = 0, Igraphvitvector = 1, Igraphvitvectorptr = 2
type
  enumigraphestypet* {.size: sizeof(cuint).} = enum
    Igraphesall = 0, Igraphesallfrom = 1, Igraphesallto = 2,
    Igraphesincident = 3, Igraphesnone = 4, Igraphes1 = 5,
    Igraphesvectorptr = 6, Igraphesvector = 7, Igraphesrange = 8,
    Igraphespairs = 9, Igraphespath = 10, Igraphesunusedwasmultipairs = 11,
    Igraphesallbetween = 12
type
  enumigrapheittypet* {.size: sizeof(cuint).} = enum
    Igrapheitrange = 0, Igrapheitvector = 1, Igrapheitvectorptr = 2
type
  enumigraphpagerankalgot* {.size: sizeof(cuint).} = enum
    Igraphpagerankalgoarpack = 1, Igraphpagerankalgoprpack = 2
type
  enumigraphfloydwarshallalgorithmt* {.size: sizeof(cuint).} = enum
    Igraphfloydwarshallautomatic = 0, Igraphfloydwarshalloriginal = 1,
    Igraphfloydwarshalltree = 2
type
  enumigraphlaplaciannormalizationt* {.size: sizeof(cuint).} = enum
    Igraphlaplacianunnormalized = 0, Igraphlaplaciansymmetric = 1,
    Igraphlaplacianleft = 2, Igraphlaplacianright = 3
type
  enumigraphblisssht* {.size: sizeof(cuint).} = enum
    Igraphblissf = 0, Igraphblissfl = 1, Igraphblissfs = 2, Igraphblissfm = 3,
    Igraphblissflm = 4, Igraphblissfsm = 5
type
  enumigraphlayoutdrldefaultt* {.size: sizeof(cuint).} = enum
    Igraphlayoutdrldefault = 0, Igraphlayoutdrlcoarsen = 1,
    Igraphlayoutdrlcoarsest = 2, Igraphlayoutdrlrefine = 3,
    Igraphlayoutdrlfinal = 4
type
  enumigraphrootchoicet* {.size: sizeof(cuint).} = enum
    Igraphrootchoicedegree = 0, Igraphrootchoiceeccentricity = 1
type
  enumigraphleadingeigenvectorcommunityhistoryt* {.size: sizeof(cuint).} = enum
    Igraphlevchistsplit = 1, Igraphlevchistfailed = 2,
    Igraphlevchiststartfull = 3, Igraphlevchiststartgiven = 4
type
  enumigraphattributetypet* {.size: sizeof(cuint).} = enum
    Igraphattributeunspecified = 0, Igraphattributenumeric = 1,
    Igraphattributeboolean = 2, Igraphattributestring = 3,
    Igraphattributeobject = 127
const
  Igraphattributedefault* = enumigraphattributetypet.Igraphattributeunspecified
type
  enumigraphattributeelemtypet* {.size: sizeof(cuint).} = enum
    Igraphattributegraph = 0, Igraphattributevertex = 1, Igraphattributeedge = 2
type
  enumigraphattributecombinationtypet* {.size: sizeof(cuint).} = enum
    Igraphattributecombineignore = 0, Igraphattributecombinedefault = 1,
    Igraphattributecombinefunction = 2, Igraphattributecombinesum = 3,
    Igraphattributecombineprod = 4, Igraphattributecombinemin = 5,
    Igraphattributecombinemax = 6, Igraphattributecombinerandom = 7,
    Igraphattributecombinefirst = 8, Igraphattributecombinelast = 9,
    Igraphattributecombinemean = 10, Igraphattributecombinemedian = 11,
    Igraphattributecombineconcat = 12
type
  enumigraphlapackdsyevwhicht* {.size: sizeof(cuint).} = enum
    Igraphlapackdsyevall = 0, Igraphlapackdsyevinterval = 1,
    Igraphlapackdsyevselect = 2
type
  enumigraphlapackdgeevxbalancet* {.size: sizeof(cuint).} = enum
    Igraphlapackdgeevxbalancenone = 0, Igraphlapackdgeevxbalanceperm = 1,
    Igraphlapackdgeevxbalancescale = 2, Igraphlapackdgeevxbalanceboth = 3
type
  enumigrapheigenalgorithmt* {.size: sizeof(cuint).} = enum
    Igrapheigenauto = 0, Igrapheigenlapack = 1, Igrapheigenarpack = 2,
    Igrapheigencompauto = 3, Igrapheigencomplapack = 4,
    Igrapheigencomparpack = 5
type
  enumigrapheigenwhichpositiont* {.size: sizeof(cuint).} = enum
    Igrapheigenlm = 0, Igrapheigensm = 1, Igrapheigenla = 2, Igrapheigensa = 3,
    Igrapheigenbe = 4, Igrapheigenlr = 5, Igrapheigensr = 6, Igrapheigenli = 7,
    Igrapheigensi = 8, Igrapheigenall = 9, Igrapheigeninterval = 10,
    Igrapheigenselect = 11
type
  enumigraphlaplacianspectralembeddingtypet* {.size: sizeof(cuint).} = enum
    Igraphembeddingda = 0, Igraphembeddingidad = 1, Igraphembeddingdad = 2,
    Igraphembeddingoap = 3
type
  enumigraphcoloringgreedyt* {.size: sizeof(cuint).} = enum
    Igraphcoloringgreedycoloredneighbors = 0, Igraphcoloringgreedydsatur = 1
type
  compilerfile* = distinct object
type
  Igraphfree* = distinct object
type
  Int64min* = distinct object
type
  structcsigraphnumeric* = distinct object
type
  structcsigraphsymbolic* = distinct object
type
  Int64max* = distinct object
type
  Igraphiclz64* = distinct object
type
  structiowidedata* = distinct object
type
  Uint64max* = distinct object
type
  internalbool* = distinct object
type
  Igraphinfinity* = distinct object
type
  structigraphipropertycachet* = distinct object
type
  structiocodecvt* = distinct object
type
  Igraphexport* = distinct object
type
  Prid64* = distinct object
#type
#  int* = distinct object
type
  Igraphcalloc* = distinct object
type
  Igraphictz64* = distinct object
type
  compilergnuc* = distinct object
type
  Igraphipopcount64* = distinct object
type
  Igraphrealloc* = distinct object
type
  structigraphsafelocales* = distinct object
type
  Priu64* = distinct object
type
  structiomarker* = distinct object
type
  structcsigraphsparse* = distinct object
type
  Uint64min* = distinct object
type
  igraphrealt* = cdouble     ## Generated based on /usr/include/igraph/igraph_types.h:57:16
  igraphvectort* = structigraphvectort ## Generated based on /usr/include/igraph/igraph_vector_type.h:33:3
  igraphmatrixt* = structigraphmatrixt ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:27:3
  igraphvectorchart* = structigraphvectorchart ## Generated based on /usr/include/igraph/igraph_vector_type.h:33:3
  igraphmatrixchart* = structigraphmatrixchart ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:27:3
  igraphboolt* = bool        ## Generated based on /usr/include/igraph/igraph_types.h:62:26
  igraphvectorboolt* = structigraphvectorboolt ## Generated based on /usr/include/igraph/igraph_vector_type.h:33:3
  igraphmatrixboolt* = structigraphmatrixboolt ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:27:3
  igraphintegert* = int64    ## Generated based on /usr/include/igraph/igraph_types.h:48:17
  igraphvectorintt* = structigraphvectorintt ## Generated based on /usr/include/igraph/igraph_vector_type.h:33:3
  igraphmatrixintt* = structigraphmatrixintt ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:27:3
  igraphcomplext* = structigraphcomplext ## Generated based on /usr/include/igraph/igraph_complex.h:34:3
  igraphvectorcomplext* = structigraphvectorcomplext ## Generated based on /usr/include/igraph/igraph_vector_type.h:33:3
  igraphmatrixcomplext* = structigraphmatrixcomplext ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:27:3
  igraphvectorlistt* = structigraphvectorlistt ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:47:3
  igrapht* = structigraphs   ## Generated based on /usr/include/igraph/igraph_datatype.h:121:3
  igraphgraphlistt* = structigraphgraphlistt ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:47:3
  igraphmatrixlistt* = structigraphmatrixlistt ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:47:3
  igraphbitsett* = structigraphbitsett ## Generated based on /usr/include/igraph/igraph_bitset.h:234:3
  igraphbitsetlistt* = structigraphbitsetlistt ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:47:3
  igrapherrortypet* = enumigrapherrortypet ## Generated based on /usr/include/igraph/igraph_error.h:379:3
  igrapherrort* = igrapherrortypet ## Generated based on /usr/include/igraph/igraph_error.h:407:29
  igrapherrorhandlert* = proc (a0: cstring; a1: cstring; a2: cint;
                               a3: igrapherrort): void {.cdecl.} ## Generated based on /usr/include/igraph/igraph_error.h:422:14
  structigraphiprotectedptr* {.pure, inheritable, bycopy.} = object
    level*: cint             ## Generated based on /usr/include/igraph/igraph_error.h:556:8
    ptrfield*: pointer
    funcfield*: proc (a0: pointer): void {.cdecl.}

  igraphfinallyfunct* = proc (a0: pointer): void {.cdecl.} ## Generated based on /usr/include/igraph/igraph_error.h:562:14
  igraphwarninghandlert* = proc (a0: cstring; a1: cstring; a2: cint): void {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_error.h:801:14
  igraphfatalhandlert* = proc (a0: cstring; a1: cstring; a2: cint): void {.cdecl.} ## Generated based on /usr/include/igraph/igraph_error.h:892:14
  igraphuintt* = uint64      ## Generated based on /usr/include/igraph/igraph_types.h:49:18
  File* = structiofile       ## Generated based on /usr/include/bits/types/FILE.h:7:25
  structigraphcomplext* {.pure, inheritable, bycopy.} = object
    dat*: array[2'i64, igraphrealt] ## Generated based on /usr/include/igraph/igraph_complex.h:32:16
  
  igraphidirectedt* = enumigraphidirectedt ## Generated based on /usr/include/igraph/igraph_constants.h:36:61
  igraphloopst* = enumigraphloopst ## Generated based on /usr/include/igraph/igraph_constants.h:42:103
  igraphmultiplet* = enumigraphmultiplet ## Generated based on /usr/include/igraph/igraph_constants.h:44:62
  igraphordert* = enumigraphordert ## Generated based on /usr/include/igraph/igraph_constants.h:46:62
  igraphoptimalt* = enumigraphoptimalt ## Generated based on /usr/include/igraph/igraph_constants.h:48:57
  igraphneimodet* = enumigraphneimodet ## Generated based on /usr/include/igraph/igraph_constants.h:52:64
  igraphconnectednesst* = enumigraphconnectednesst ## Generated based on /usr/include/igraph/igraph_constants.h:58:53
  igraphreciprocityt* = enumigraphreciprocityt ## Generated based on /usr/include/igraph/igraph_constants.h:62:16
  igraphadjacencyt* = enumigraphadjacencyt ## Generated based on /usr/include/igraph/igraph_constants.h:69:16
  igraphstarmodet* = enumigraphstarmodet ## Generated based on /usr/include/igraph/igraph_constants.h:74:16
  igraphwheelmodet* = enumigraphwheelmodet ## Generated based on /usr/include/igraph/igraph_constants.h:79:16
  igraphtreemodet* = enumigraphtreemodet ## Generated based on /usr/include/igraph/igraph_constants.h:83:16
  igrapherdosrenyit* = enumigrapherdosrenyit ## Generated based on /usr/include/igraph/igraph_constants.h:87:16
  igraphgetadjacencyt* = enumigraphgetadjacencyt ## Generated based on /usr/include/igraph/igraph_constants.h:92:16
  igraphdegseqt* = enumigraphdegseqt ## Generated based on /usr/include/igraph/igraph_constants.h:104:16
  igraphrealizedegseqt* = enumigraphrealizedegseqt ## Generated based on /usr/include/igraph/igraph_constants.h:109:16
  igraphrandomtreet* = enumigraphrandomtreet ## Generated based on /usr/include/igraph/igraph_constants.h:113:16
  igraphfileformattypet* = enumigraphfileformattypet ## Generated based on /usr/include/igraph/igraph_constants.h:120:16
  igraphrewiringt* = enumigraphrewiringt ## Generated based on /usr/include/igraph/igraph_constants.h:124:16
  igraphedgeordertypet* = enumigraphedgeordertypet ## Generated based on /usr/include/igraph/igraph_constants.h:129:16
  igraphtodirectedt* = enumigraphtodirectedt ## Generated based on /usr/include/igraph/igraph_constants.h:135:16
  igraphtoundirectedt* = enumigraphtoundirectedt ## Generated based on /usr/include/igraph/igraph_constants.h:140:16
  igraphvconnneit* = enumigraphvconnneit ## Generated based on /usr/include/igraph/igraph_constants.h:146:16
  igraphspincommupdatet* = enumigraphspincommupdatet ## Generated based on /usr/include/igraph/igraph_constants.h:150:16
  igraphlazyadlistsimplifyt* = enumigraphlazyadlistsimplifyt ## Generated based on /usr/include/igraph/igraph_constants.h:154:16
  igraphtransitivitymodet* = enumigraphtransitivitymodet ## Generated based on /usr/include/igraph/igraph_constants.h:158:16
  igraphspinglassimplementationt* = enumigraphspinglassimplementationt ## Generated based on /usr/include/igraph/igraph_constants.h:162:16
  igraphcommunitycomparisont* = enumigraphcommunitycomparisont ## Generated based on /usr/include/igraph/igraph_constants.h:169:16
  igraphaddweightst* = enumigraphaddweightst ## Generated based on /usr/include/igraph/igraph_constants.h:174:16
  igraphbarabasialgorithmt* = enumigraphbarabasialgorithmt ## Generated based on /usr/include/igraph/igraph_constants.h:179:16
  igraphfasalgorithmt* = enumigraphfasalgorithmt ## Generated based on /usr/include/igraph/igraph_constants.h:183:16
  igraphsubgraphimplementationt* = enumigraphsubgraphimplementationt ## Generated based on /usr/include/igraph/igraph_constants.h:188:16
  igraphimitatealgorithmt* = enumigraphimitatealgorithmt ## Generated based on /usr/include/igraph/igraph_constants.h:193:16
  igraphlayoutgridt* = enumigraphlayoutgridt ## Generated based on /usr/include/igraph/igraph_constants.h:198:16
  igraphrandomwalkstuckt* = enumigraphrandomwalkstuckt ## Generated based on /usr/include/igraph/igraph_constants.h:202:16
  igraphvoronoitiebreakert* = enumigraphvoronoitiebreakert ## Generated based on /usr/include/igraph/igraph_constants.h:207:16
  igraphmatrixstoraget* = enumigraphmatrixstoraget ## Generated based on /usr/include/igraph/igraph_constants.h:211:16
  structigraphvectort* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphrealt ## Generated based on /usr/include/igraph/igraph_vector_type.h:29:16
    storend*: ptr igraphrealt
    endfield*: ptr igraphrealt

  structigraphvectorchart* {.pure, inheritable, bycopy.} = object
    storbegin*: cstring      ## Generated based on /usr/include/igraph/igraph_vector_type.h:29:16
    storend*: cstring
    endfield*: cstring

  structigraphvectorboolt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphboolt ## Generated based on /usr/include/igraph/igraph_vector_type.h:29:16
    storend*: ptr igraphboolt
    endfield*: ptr igraphboolt

  structigraphvectorintt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphintegert ## Generated based on /usr/include/igraph/igraph_vector_type.h:29:16
    storend*: ptr igraphintegert
    endfield*: ptr igraphintegert

  structigraphvectorcomplext* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphcomplext ## Generated based on /usr/include/igraph/igraph_vector_type.h:29:16
    storend*: ptr igraphcomplext
    endfield*: ptr igraphcomplext

  structigraphrngtypet* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /usr/include/igraph/igraph_random.h:80:16
    bits*: uint8
    init*: proc (a0: ptr pointer): igrapherrort {.cdecl.}
    destroy*: proc (a0: pointer): void {.cdecl.}
    seed*: proc (a0: pointer; a1: igraphuintt): igrapherrort {.cdecl.}
    get*: proc (a0: pointer): igraphuintt {.cdecl.}
    getint*: proc (a0: pointer; a1: igraphintegert; a2: igraphintegert): igraphintegert {.
        cdecl.}
    getreal*: proc (a0: pointer): igraphrealt {.cdecl.}
    getnorm*: proc (a0: pointer): igraphrealt {.cdecl.}
    getgeom*: proc (a0: pointer; a1: igraphrealt): igraphrealt {.cdecl.}
    getbinom*: proc (a0: pointer; a1: igraphintegert; a2: igraphrealt): igraphrealt {.
        cdecl.}
    getexp*: proc (a0: pointer; a1: igraphrealt): igraphrealt {.cdecl.}
    getgamma*: proc (a0: pointer; a1: igraphrealt; a2: igraphrealt): igraphrealt {.
        cdecl.}
    getpois*: proc (a0: pointer; a1: igraphrealt): igraphrealt {.cdecl.}

  igraphrngtypet* = structigraphrngtypet ## Generated based on /usr/include/igraph/igraph_random.h:106:3
  structigraphrngt* {.pure, inheritable, bycopy.} = object
    typefield*: ptr igraphrngtypet ## Generated based on /usr/include/igraph/igraph_random.h:108:16
    state*: pointer
    isseeded*: igraphboolt

  igraphrngt* = structigraphrngt ## Generated based on /usr/include/igraph/igraph_random.h:112:3
  igraphprogresshandlert* = proc (a0: cstring; a1: igraphrealt; a2: pointer): igrapherrort {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_progress.h:146:24
  igraphstatushandlert* = proc (a0: cstring; a1: pointer): igrapherrort {.cdecl.} ## Generated based on /usr/include/igraph/igraph_statusbar.h:68:24
  structigraphmatrixt* {.pure, inheritable, bycopy.} = object
    data*: igraphvectort     ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:24:16
    nrow*: igraphintegert
    ncol*: igraphintegert

  structigraphmatrixintt* {.pure, inheritable, bycopy.} = object
    data*: igraphvectorintt  ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:24:16
    nrow*: igraphintegert
    ncol*: igraphintegert

  structigraphmatrixchart* {.pure, inheritable, bycopy.} = object
    data*: igraphvectorchart ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:24:16
    nrow*: igraphintegert
    ncol*: igraphintegert

  structigraphmatrixboolt* {.pure, inheritable, bycopy.} = object
    data*: igraphvectorboolt ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:24:16
    nrow*: igraphintegert
    ncol*: igraphintegert

  structigraphmatrixcomplext* {.pure, inheritable, bycopy.} = object
    data*: igraphvectorcomplext ## Generated based on /usr/include/igraph/igraph_matrix_pmt.h:24:16
    nrow*: igraphintegert
    ncol*: igraphintegert

  structigrapharray3t* {.pure, inheritable, bycopy.} = object
    data*: igraphvectort     ## Generated based on /usr/include/igraph/igraph_array_pmt.h:24:16
    n1*: igraphintegert
    n2*: igraphintegert
    n3*: igraphintegert
    n1n2*: igraphintegert

  igrapharray3t* = structigrapharray3t ## Generated based on /usr/include/igraph/igraph_array_pmt.h:27:3
  structigrapharray3intt* {.pure, inheritable, bycopy.} = object
    data*: igraphvectorintt  ## Generated based on /usr/include/igraph/igraph_array_pmt.h:24:16
    n1*: igraphintegert
    n2*: igraphintegert
    n3*: igraphintegert
    n1n2*: igraphintegert

  igrapharray3intt* = structigrapharray3intt ## Generated based on /usr/include/igraph/igraph_array_pmt.h:27:3
  structigrapharray3chart* {.pure, inheritable, bycopy.} = object
    data*: igraphvectorchart ## Generated based on /usr/include/igraph/igraph_array_pmt.h:24:16
    n1*: igraphintegert
    n2*: igraphintegert
    n3*: igraphintegert
    n1n2*: igraphintegert

  igrapharray3chart* = structigrapharray3chart ## Generated based on /usr/include/igraph/igraph_array_pmt.h:27:3
  structigrapharray3boolt* {.pure, inheritable, bycopy.} = object
    data*: igraphvectorboolt ## Generated based on /usr/include/igraph/igraph_array_pmt.h:24:16
    n1*: igraphintegert
    n2*: igraphintegert
    n3*: igraphintegert
    n1n2*: igraphintegert

  igrapharray3boolt* = structigrapharray3boolt ## Generated based on /usr/include/igraph/igraph_array_pmt.h:27:3
  structigraphbitsett* {.pure, inheritable, bycopy.} = object
    size*: igraphintegert    ## Generated based on /usr/include/igraph/igraph_bitset.h:230:9
    storbegin*: ptr igraphuintt
    storend*: ptr igraphuintt

  structigraphdqueuet* {.pure, inheritable, bycopy.} = object
    begin*: ptr igraphrealt  ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:29:16
    endfield*: ptr igraphrealt
    storbegin*: ptr igraphrealt
    storend*: ptr igraphrealt

  igraphdqueuet* = structigraphdqueuet ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:34:3
  structigraphdqueuechart* {.pure, inheritable, bycopy.} = object
    begin*: cstring          ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:29:16
    endfield*: cstring
    storbegin*: cstring
    storend*: cstring

  igraphdqueuechart* = structigraphdqueuechart ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:34:3
  structigraphdqueueboolt* {.pure, inheritable, bycopy.} = object
    begin*: ptr igraphboolt  ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:29:16
    endfield*: ptr igraphboolt
    storbegin*: ptr igraphboolt
    storend*: ptr igraphboolt

  igraphdqueueboolt* = structigraphdqueueboolt ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:34:3
  structigraphdqueueintt* {.pure, inheritable, bycopy.} = object
    begin*: ptr igraphintegert ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:29:16
    endfield*: ptr igraphintegert
    storbegin*: ptr igraphintegert
    storend*: ptr igraphintegert

  igraphdqueueintt* = structigraphdqueueintt ## Generated based on /usr/include/igraph/igraph_dqueue_pmt.h:34:3
  structigraphstackt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphrealt ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:31:16
    storend*: ptr igraphrealt
    endfield*: ptr igraphrealt

  igraphstackt* = structigraphstackt ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:35:3
  structigraphstackintt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphintegert ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:31:16
    storend*: ptr igraphintegert
    endfield*: ptr igraphintegert

  igraphstackintt* = structigraphstackintt ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:35:3
  structigraphstackchart* {.pure, inheritable, bycopy.} = object
    storbegin*: cstring      ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:31:16
    storend*: cstring
    endfield*: cstring

  igraphstackchart* = structigraphstackchart ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:35:3
  structigraphstackboolt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphboolt ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:31:16
    storend*: ptr igraphboolt
    endfield*: ptr igraphboolt

  igraphstackboolt* = structigraphstackboolt ## Generated based on /usr/include/igraph/igraph_stack_pmt.h:35:3
  structigraphheapt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphrealt ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:24:16
    storend*: ptr igraphrealt
    endfield*: ptr igraphrealt
    destroy*: igraphboolt

  igraphheapt* = structigraphheapt ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:29:3
  structigraphheapmint* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphrealt ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:24:16
    storend*: ptr igraphrealt
    endfield*: ptr igraphrealt
    destroy*: igraphboolt

  igraphheapmint* = structigraphheapmint ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:29:3
  structigraphheapintt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphintegert ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:24:16
    storend*: ptr igraphintegert
    endfield*: ptr igraphintegert
    destroy*: igraphboolt

  igraphheapintt* = structigraphheapintt ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:29:3
  structigraphheapminintt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphintegert ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:24:16
    storend*: ptr igraphintegert
    endfield*: ptr igraphintegert
    destroy*: igraphboolt

  igraphheapminintt* = structigraphheapminintt ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:29:3
  structigraphheapchart* {.pure, inheritable, bycopy.} = object
    storbegin*: cstring      ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:24:16
    storend*: cstring
    endfield*: cstring
    destroy*: igraphboolt

  igraphheapchart* = structigraphheapchart ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:29:3
  structigraphheapminchart* {.pure, inheritable, bycopy.} = object
    storbegin*: cstring      ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:24:16
    storend*: cstring
    endfield*: cstring
    destroy*: igraphboolt

  igraphheapminchart* = structigraphheapminchart ## Generated based on /usr/include/igraph/igraph_heap_pmt.h:29:3
  structigraphpsumtreet* {.pure, inheritable, bycopy.} = object
    v*: igraphvectort        ## Generated based on /usr/include/igraph/igraph_psumtree.h:33:9
    size*: igraphintegert
    offset*: igraphintegert

  igraphpsumtreet* = structigraphpsumtreet ## Generated based on /usr/include/igraph/igraph_psumtree.h:37:3
  structsigraphstrvector* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr cstring  ## Generated based on /usr/include/igraph/igraph_strvector.h:38:16
    storend*: ptr cstring
    endfield*: ptr cstring

  igraphstrvectort* = structsigraphstrvector ## Generated based on /usr/include/igraph/igraph_strvector.h:43:3
  structigraphvectorlistt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphvectort ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:40:9
    storend*: ptr igraphvectort
    endfield*: ptr igraphvectort

  structigraphvectorintlistt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphvectorintt ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:40:9
    storend*: ptr igraphvectorintt
    endfield*: ptr igraphvectorintt

  igraphvectorintlistt* = structigraphvectorintlistt ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:47:3
  structsvectorptr* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr pointer  ## Generated based on /usr/include/igraph/igraph_vector_ptr.h:42:16
    storend*: ptr pointer
    endfield*: ptr pointer
    itemdestructor*: igraphfinallyfunct

  igraphvectorptrt* = structsvectorptr ## Generated based on /usr/include/igraph/igraph_vector_ptr.h:47:3
  igraphipropertycachet* = structigraphipropertycachet ## Generated based on /usr/include/igraph/igraph_datatype.h:34:42
  igraphcachedpropertyt* = enumigraphcachedpropertyt ## Generated based on /usr/include/igraph/igraph_datatype.h:69:3
  structigraphs* {.pure, inheritable, bycopy.} = object
    n*: igraphintegert       ## Generated based on /usr/include/igraph/igraph_datatype.h:110:16
    directed*: igraphboolt
    fromfield*: igraphvectorintt
    to*: igraphvectorintt
    oi*: igraphvectorintt
    ii*: igraphvectorintt
    os*: igraphvectorintt
    isfield*: igraphvectorintt
    attr*: pointer
    cache*: ptr igraphipropertycachet

  structigrapharpackoptionst* {.pure, inheritable, bycopy.} = object
    bmat*: array[1'i64, cschar] ## Generated based on /usr/include/igraph/igraph_arpack.h:225:16
    n*: cint
    which*: array[2'i64, cschar]
    nev*: cint
    tol*: igraphrealt
    ncv*: cint
    ldv*: cint
    ishift*: cint
    mxiter*: cint
    nb*: cint
    mode*: cint
    start*: cint
    lworkl*: cint
    sigma*: igraphrealt
    sigmai*: igraphrealt
    info*: cint
    ierr*: cint
    noiter*: cint
    nconv*: cint
    numop*: cint
    numopb*: cint
    numreo*: cint
    iparam*: array[11'i64, cint]
    ipntr*: array[14'i64, cint]

  igrapharpackoptionst* = structigrapharpackoptionst ## Generated based on /usr/include/igraph/igraph_arpack.h:258:3
  structigrapharpackstoraget* {.pure, inheritable, bycopy.} = object
    maxn*: cint              ## Generated based on /usr/include/igraph/igraph_arpack.h:281:16
    maxncv*: cint
    maxldv*: cint
    v*: ptr igraphrealt
    workl*: ptr igraphrealt
    workd*: ptr igraphrealt
    d*: ptr igraphrealt
    resid*: ptr igraphrealt
    ax*: ptr igraphrealt
    select*: ptr cint
    di*: ptr igraphrealt
    workev*: ptr igraphrealt

  igrapharpackstoraget* = structigrapharpackstoraget ## Generated based on /usr/include/igraph/igraph_arpack.h:293:3
  igrapharpackfunctiont* = proc (a0: ptr igraphrealt; a1: ptr igraphrealt;
                                 a2: cint; a3: pointer): igrapherrort {.cdecl.} ## Generated based on /usr/include/igraph/igraph_arpack.h:319:24
  structigraphsparsematt* {.pure, inheritable, bycopy.} = object
    cs*: ptr structcsigraphsparse ## Generated based on /usr/include/igraph/igraph_sparsemat.h:47:9
  
  igraphsparsematt* = structigraphsparsematt ## Generated based on /usr/include/igraph/igraph_sparsemat.h:49:3
  structigraphsparsematsymbolict* {.pure, inheritable, bycopy.} = object
    symbolic*: ptr structcsigraphsymbolic ## Generated based on /usr/include/igraph/igraph_sparsemat.h:51:9
  
  igraphsparsematsymbolict* = structigraphsparsematsymbolict ## Generated based on /usr/include/igraph/igraph_sparsemat.h:53:3
  structigraphsparsematnumerict* {.pure, inheritable, bycopy.} = object
    numeric*: ptr structcsigraphnumeric ## Generated based on /usr/include/igraph/igraph_sparsemat.h:55:9
  
  igraphsparsematnumerict* = structigraphsparsematnumerict ## Generated based on /usr/include/igraph/igraph_sparsemat.h:57:3
  igraphsparsemattypet* = enumigraphsparsemattypet ## Generated based on /usr/include/igraph/igraph_sparsemat.h:61:16
  structigraphsparsematiteratort* {.pure, inheritable, bycopy.} = object
    mat*: ptr igraphsparsematt ## Generated based on /usr/include/igraph/igraph_sparsemat.h:63:9
    pos*: igraphintegert
    col*: igraphintegert

  igraphsparsematiteratort* = structigraphsparsematiteratort ## Generated based on /usr/include/igraph/igraph_sparsemat.h:67:3
  igraphsparsematsolvet* = enumigraphsparsematsolvet ## Generated based on /usr/include/igraph/igraph_sparsemat.h:175:16
  structigraphgraphlistt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igrapht  ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:40:9
    storend*: ptr igrapht
    endfield*: ptr igrapht
    directed*: igraphboolt

  igraphvstypet* = enumigraphvstypet ## Generated based on /usr/include/igraph/igraph_iterators.h:49:3
  structigraphvst_data_t_adj_t* {.pure, inheritable, bycopy.} = object
    vid*: igraphintegert
    mode*: igraphneimodet

  structigraphvst_data_t_range_t* {.pure, inheritable, bycopy.} = object
    start*: igraphintegert
    endfield*: igraphintegert

  structigraphvst_data_t* {.union, bycopy.} = object
    vid*: igraphintegert
    vecptr*: ptr igraphvectorintt
    adj*: structigraphvst_data_t_adj_t
    range*: structigraphvst_data_t_range_t

  structigraphvst* {.pure, inheritable, bycopy.} = object
    typefield*: igraphvstypet ## Generated based on /usr/include/igraph/igraph_iterators.h:51:16
    data*: structigraphvst_data_t

  igraphvst* = structigraphvst ## Generated based on /usr/include/igraph/igraph_iterators.h:65:3
  igraphvittypet* = enumigraphvittypet ## Generated based on /usr/include/igraph/igraph_iterators.h:117:3
  structigraphvitt* {.pure, inheritable, bycopy.} = object
    typefield*: igraphvittypet ## Generated based on /usr/include/igraph/igraph_iterators.h:119:16
    pos*: igraphintegert
    start*: igraphintegert
    endfield*: igraphintegert
    vec*: ptr igraphvectorintt

  igraphvitt* = structigraphvitt ## Generated based on /usr/include/igraph/igraph_iterators.h:125:3
  igraphestypet* = enumigraphestypet ## Generated based on /usr/include/igraph/igraph_iterators.h:245:3
  structigraphest_data_t_incident_t* {.pure, inheritable, bycopy.} = object
    vid*: igraphintegert
    mode*: igraphneimodet

  structigraphest_data_t_range_t* {.pure, inheritable, bycopy.} = object
    start*: igraphintegert
    endfield*: igraphintegert

  structigraphest_data_t_path_t* {.pure, inheritable, bycopy.} = object
    ptrfield*: ptr igraphvectorintt
    mode*: igraphboolt

  structigraphest_data_t_between_t* {.pure, inheritable, bycopy.} = object
    fromfield*: igraphintegert
    to*: igraphintegert
    directed*: igraphboolt

  structigraphest_data_t* {.union, bycopy.} = object
    vid*: igraphintegert
    eid*: igraphintegert
    vecptr*: ptr igraphvectorintt
    incident*: structigraphest_data_t_incident_t
    range*: structigraphest_data_t_range_t
    path*: structigraphest_data_t_path_t
    between*: structigraphest_data_t_between_t

  structigraphest* {.pure, inheritable, bycopy.} = object
    typefield*: igraphestypet ## Generated based on /usr/include/igraph/igraph_iterators.h:247:16
    data*: structigraphest_data_t

  igraphest* = structigraphest ## Generated based on /usr/include/igraph/igraph_iterators.h:271:3
  igrapheittypet* = enumigrapheittypet ## Generated based on /usr/include/igraph/igraph_iterators.h:332:3
  structigrapheitt* {.pure, inheritable, bycopy.} = object
    typefield*: igrapheittypet ## Generated based on /usr/include/igraph/igraph_iterators.h:334:16
    pos*: igraphintegert
    start*: igraphintegert
    endfield*: igraphintegert
    vec*: ptr igraphvectorintt

  igrapheitt* = structigrapheitt ## Generated based on /usr/include/igraph/igraph_iterators.h:340:3
  igraphedgetypeswt* = cuint ## Generated based on /usr/include/igraph/igraph_graphicality.h:30:22
  structigraphmatrixlistt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphmatrixt ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:40:9
    storend*: ptr igraphmatrixt
    endfield*: ptr igraphmatrixt

  igraphpagerankalgot* = enumigraphpagerankalgot ## Generated based on /usr/include/igraph/igraph_centrality.h:98:3
  igraphastarheuristicfunct* = proc (a0: ptr igraphrealt; a1: igraphintegert;
                                     a2: igraphintegert; a3: pointer): igrapherrort {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_paths.h:63:24
  igraphfloydwarshallalgorithmt* = enumigraphfloydwarshallalgorithmt ## Generated based on /usr/include/igraph/igraph_paths.h:72:3
  igraphlaplaciannormalizationt* = enumigraphlaplaciannormalizationt ## Generated based on /usr/include/igraph/igraph_structural.h:154:3
  igraphisohandlert* = proc (a0: ptr igraphvectorintt; a1: ptr igraphvectorintt;
                             a2: pointer): igrapherrort {.cdecl.} ## Generated based on /usr/include/igraph/igraph_topology.h:87:24
  igraphisocompatt* = proc (a0: ptr igrapht; a1: ptr igrapht;
                            a2: igraphintegert; a3: igraphintegert; a4: pointer): igraphboolt {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_topology.h:114:23
  structigraphblissinfot* {.pure, inheritable, bycopy.} = object
    nofnodes*: culong        ## Generated based on /usr/include/igraph/igraph_topology.h:240:16
    nofleafnodes*: culong
    nofbadnodes*: culong
    nofcanupdates*: culong
    nofgenerators*: culong
    maxlevel*: culong
    groupsize*: cstring

  igraphblissinfot* = structigraphblissinfot ## Generated based on /usr/include/igraph/igraph_topology.h:248:3
  igraphblisssht* = enumigraphblisssht ## Generated based on /usr/include/igraph/igraph_topology.h:273:16
  igraphcliquehandlert* = proc (a0: ptr igraphvectorintt; a1: pointer): igrapherrort {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_cliques.h:103:24
  structigraphlayoutdrloptionst* {.pure, inheritable, bycopy.} = object
    edgecut*: igraphrealt    ## Generated based on /usr/include/igraph/igraph_layout.h:199:16
    inititerations*: igraphintegert
    inittemperature*: igraphrealt
    initattraction*: igraphrealt
    initdampingmult*: igraphrealt
    liquiditerations*: igraphintegert
    liquidtemperature*: igraphrealt
    liquidattraction*: igraphrealt
    liquiddampingmult*: igraphrealt
    expansioniterations*: igraphintegert
    expansiontemperature*: igraphrealt
    expansionattraction*: igraphrealt
    expansiondampingmult*: igraphrealt
    cooldowniterations*: igraphintegert
    cooldowntemperature*: igraphrealt
    cooldownattraction*: igraphrealt
    cooldowndampingmult*: igraphrealt
    crunchiterations*: igraphintegert
    crunchtemperature*: igraphrealt
    crunchattraction*: igraphrealt
    crunchdampingmult*: igraphrealt
    simmeriterations*: igraphintegert
    simmertemperature*: igraphrealt
    simmerattraction*: igraphrealt
    simmerdampingmult*: igraphrealt

  igraphlayoutdrloptionst* = structigraphlayoutdrloptionst ## Generated based on /usr/include/igraph/igraph_layout.h:225:3
  igraphlayoutdrldefaultt* = enumigraphlayoutdrldefaultt ## Generated based on /usr/include/igraph/igraph_layout.h:246:16
  igraphrootchoicet* = enumigraphrootchoicet ## Generated based on /usr/include/igraph/igraph_layout.h:287:3
  igraphbfshandlert* = proc (a0: ptr igrapht; a1: igraphintegert;
                             a2: igraphintegert; a3: igraphintegert;
                             a4: igraphintegert; a5: igraphintegert; a6: pointer): igrapherrort {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_visitor.h:74:24
  igraphdfshandlert* = proc (a0: ptr igrapht; a1: igraphintegert;
                             a2: igraphintegert; a3: pointer): igrapherrort {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_visitor.h:124:24
  igraphleadingeigenvectorcommunityhistoryt* = enumigraphleadingeigenvectorcommunityhistoryt ## Generated based on /usr/include/igraph/igraph_community.h:163:16
  igraphcommunityleadingeigenvectorcallbackt* = proc (a0: ptr igraphvectorintt;
      a1: igraphintegert; a2: igraphrealt; a3: ptr igraphvectort;
      a4: igrapharpackfunctiont; a5: pointer; a6: pointer): igrapherrort {.cdecl.} ## Generated based on /usr/include/igraph/igraph_community.h:193:24
  igraphattributetypet* = enumigraphattributetypet ## Generated based on /usr/include/igraph/igraph_attributes.h:134:16
  structigraphattributerecordt* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /usr/include/igraph/igraph_attributes.h:136:16
    typefield*: igraphattributetypet
    value*: pointer

  igraphattributerecordt* = structigraphattributerecordt ## Generated based on /usr/include/igraph/igraph_attributes.h:140:3
  igraphattributeelemtypet* = enumigraphattributeelemtypet ## Generated based on /usr/include/igraph/igraph_attributes.h:145:16
  igraphattributecombinationtypet* = enumigraphattributecombinationtypet ## Generated based on /usr/include/igraph/igraph_attributes.h:180:3
  igraphfunctionpointert* = proc (): void {.cdecl.} ## Generated based on /usr/include/igraph/igraph_attributes.h:182:16
  structigraphattributecombinationrecordt* {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /usr/include/igraph/igraph_attributes.h:184:16
    typefield*: igraphattributecombinationtypet
    funcfield*: igraphfunctionpointert

  igraphattributecombinationrecordt* = structigraphattributecombinationrecordt ## Generated based on /usr/include/igraph/igraph_attributes.h:188:3
  structigraphattributecombinationt* {.pure, inheritable, bycopy.} = object
    list*: igraphvectorptrt  ## Generated based on /usr/include/igraph/igraph_attributes.h:190:16
  
  igraphattributecombinationt* = structigraphattributecombinationt ## Generated based on /usr/include/igraph/igraph_attributes.h:192:3
  structigraphattributetablet* {.pure, inheritable, bycopy.} = object
    init*: proc (a0: ptr igrapht; a1: ptr igraphvectorptrt): igrapherrort {.
        cdecl.}              ## Generated based on /usr/include/igraph/igraph_attributes.h:313:16
    destroy*: proc (a0: ptr igrapht): void {.cdecl.}
    copy*: proc (a0: ptr igrapht; a1: ptr igrapht; a2: igraphboolt;
                 a3: igraphboolt; a4: igraphboolt): igrapherrort {.cdecl.}
    addvertices*: proc (a0: ptr igrapht; a1: igraphintegert;
                        a2: ptr igraphvectorptrt): igrapherrort {.cdecl.}
    permutevertices*: proc (a0: ptr igrapht; a1: ptr igrapht;
                            a2: ptr igraphvectorintt): igrapherrort {.cdecl.}
    combinevertices*: proc (a0: ptr igrapht; a1: ptr igrapht;
                            a2: ptr igraphvectorintlistt;
                            a3: ptr igraphattributecombinationt): igrapherrort {.
        cdecl.}
    addedges*: proc (a0: ptr igrapht; a1: ptr igraphvectorintt;
                     a2: ptr igraphvectorptrt): igrapherrort {.cdecl.}
    permuteedges*: proc (a0: ptr igrapht; a1: ptr igrapht;
                         a2: ptr igraphvectorintt): igrapherrort {.cdecl.}
    combineedges*: proc (a0: ptr igrapht; a1: ptr igrapht;
                         a2: ptr igraphvectorintlistt;
                         a3: ptr igraphattributecombinationt): igrapherrort {.
        cdecl.}
    getinfo*: proc (a0: ptr igrapht; a1: ptr igraphstrvectort;
                    a2: ptr igraphvectorintt; a3: ptr igraphstrvectort;
                    a4: ptr igraphvectorintt; a5: ptr igraphstrvectort;
                    a6: ptr igraphvectorintt): igrapherrort {.cdecl.}
    hasattr*: proc (a0: ptr igrapht; a1: igraphattributeelemtypet; a2: cstring): igraphboolt {.
        cdecl.}
    gettype*: proc (a0: ptr igrapht; a1: ptr igraphattributetypet;
                    a2: igraphattributeelemtypet; a3: cstring): igrapherrort {.
        cdecl.}
    getnumericgraphattr*: proc (a0: ptr igrapht; a1: cstring;
                                a2: ptr igraphvectort): igrapherrort {.cdecl.}
    getstringgraphattr*: proc (a0: ptr igrapht; a1: cstring;
                               a2: ptr igraphstrvectort): igrapherrort {.cdecl.}
    getboolgraphattr*: proc (a0: ptr igrapht; a1: cstring;
                             a2: ptr igraphvectorboolt): igrapherrort {.cdecl.}
    getnumericvertexattr*: proc (a0: ptr igrapht; a1: cstring; a2: igraphvst;
                                 a3: ptr igraphvectort): igrapherrort {.cdecl.}
    getstringvertexattr*: proc (a0: ptr igrapht; a1: cstring; a2: igraphvst;
                                a3: ptr igraphstrvectort): igrapherrort {.cdecl.}
    getboolvertexattr*: proc (a0: ptr igrapht; a1: cstring; a2: igraphvst;
                              a3: ptr igraphvectorboolt): igrapherrort {.cdecl.}
    getnumericedgeattr*: proc (a0: ptr igrapht; a1: cstring; a2: igraphest;
                               a3: ptr igraphvectort): igrapherrort {.cdecl.}
    getstringedgeattr*: proc (a0: ptr igrapht; a1: cstring; a2: igraphest;
                              a3: ptr igraphstrvectort): igrapherrort {.cdecl.}
    getbooledgeattr*: proc (a0: ptr igrapht; a1: cstring; a2: igraphest;
                            a3: ptr igraphvectorboolt): igrapherrort {.cdecl.}

  igraphattributetablet* = structigraphattributetablet ## Generated based on /usr/include/igraph/igraph_attributes.h:366:3
  igraphwritegmlswt* = cuint ## Generated based on /usr/include/igraph/igraph_foreign.h:73:22
  igraphsafelocalet* = ptr structigraphsafelocales ## Generated based on /usr/include/igraph/igraph_foreign.h:106:37
  igraphmotifshandlert* = proc (a0: ptr igrapht; a1: ptr igraphvectorintt;
                                a2: igraphintegert; a3: pointer): igrapherrort {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_motifs.h:68:24
  structigraphmaxflowstatst* {.pure, inheritable, bycopy.} = object
    nopush*: igraphintegert  ## Generated based on /usr/include/igraph/igraph_flow.h:56:9
    norelabel*: igraphintegert
    nogap*: igraphintegert
    nogapnodes*: igraphintegert
    nobfs*: igraphintegert

  igraphmaxflowstatst* = structigraphmaxflowstatst ## Generated based on /usr/include/igraph/igraph_flow.h:58:3
  igraphscalarfunctiont* = proc (a0: ptr igraphvectort; a1: ptr igraphvectort;
                                 a2: pointer): igraphrealt {.cdecl.} ## Generated based on /usr/include/igraph/igraph_nongraph.h:43:24
  igraphvectorfunctiont* = proc (a0: ptr igraphvectort; a1: ptr igraphvectort;
                                 a2: ptr igraphvectort; a3: pointer): void {.
      cdecl.}                ## Generated based on /usr/include/igraph/igraph_nongraph.h:46:14
  structigraphplfitresultt* {.pure, inheritable, bycopy.} = object
    continuous*: igraphboolt ## Generated based on /usr/include/igraph/igraph_nongraph.h:82:16
    alpha*: igraphrealt
    xmin*: igraphrealt
    L*: igraphrealt
    D*: igraphrealt
    data*: ptr igraphvectort

  igraphplfitresultt* = structigraphplfitresultt ## Generated based on /usr/include/igraph/igraph_nongraph.h:89:3
  structigraphadjlistt* {.pure, inheritable, bycopy.} = object
    length*: igraphintegert  ## Generated based on /usr/include/igraph/igraph_adjlist.h:35:16
    adjs*: ptr igraphvectorintt

  igraphadjlistt* = structigraphadjlistt ## Generated based on /usr/include/igraph/igraph_adjlist.h:38:3
  structigraphinclistt* {.pure, inheritable, bycopy.} = object
    length*: igraphintegert  ## Generated based on /usr/include/igraph/igraph_adjlist.h:40:16
    incs*: ptr igraphvectorintt

  igraphinclistt* = structigraphinclistt ## Generated based on /usr/include/igraph/igraph_adjlist.h:43:3
  structigraphlazyadjlistt* {.pure, inheritable, bycopy.} = object
    graph*: ptr igrapht      ## Generated based on /usr/include/igraph/igraph_adjlist.h:108:16
    length*: igraphintegert
    adjs*: ptr ptr igraphvectorintt
    mode*: igraphneimodet
    loops*: igraphloopst
    multiple*: igraphmultiplet

  igraphlazyadjlistt* = structigraphlazyadjlistt ## Generated based on /usr/include/igraph/igraph_adjlist.h:115:3
  structigraphlazyinclistt* {.pure, inheritable, bycopy.} = object
    graph*: ptr igrapht      ## Generated based on /usr/include/igraph/igraph_adjlist.h:166:16
    length*: igraphintegert
    incs*: ptr ptr igraphvectorintt
    mode*: igraphneimodet
    loops*: igraphloopst

  igraphlazyinclistt* = structigraphlazyinclistt ## Generated based on /usr/include/igraph/igraph_adjlist.h:172:3
  igraphlapackdsyevwhicht* = enumigraphlapackdsyevwhicht ## Generated based on /usr/include/igraph/igraph_lapack.h:70:16
  igraphlapackdgeevxbalancet* = enumigraphlapackdgeevxbalancet ## Generated based on /usr/include/igraph/igraph_lapack.h:92:1
  igrapheigenalgorithmt* = enumigrapheigenalgorithmt ## Generated based on /usr/include/igraph/igraph_eigen.h:41:16
  igrapheigenwhichpositiont* = enumigrapheigenwhichpositiont ## Generated based on /usr/include/igraph/igraph_eigen.h:56:1
  structigrapheigenwhicht* {.pure, inheritable, bycopy.} = object
    pos*: igrapheigenwhichpositiont ## Generated based on /usr/include/igraph/igraph_eigen.h:58:16
    howmany*: cint
    il*: cint
    iu*: cint
    vl*: igraphrealt
    vu*: igraphrealt
    vestimate*: cint
    balance*: igraphlapackdgeevxbalancet

  igrapheigenwhicht* = structigrapheigenwhicht ## Generated based on /usr/include/igraph/igraph_eigen.h:65:3
  structigraphhrgt* {.pure, inheritable, bycopy.} = object
    left*: igraphvectorintt  ## Generated based on /usr/include/igraph/igraph_hrg.h:70:16
    right*: igraphvectorintt
    prob*: igraphvectort
    vertices*: igraphvectorintt
    edges*: igraphvectorintt

  igraphhrgt* = structigraphhrgt ## Generated based on /usr/include/igraph/igraph_hrg.h:76:3
  igraphinterruptionhandlert* = proc (a0: pointer): igrapherrort {.cdecl.} ## Generated based on /usr/include/igraph/igraph_interrupt.h:109:24
  igraphlaplacianspectralembeddingtypet* = enumigraphlaplacianspectralembeddingtypet ## Generated based on /usr/include/igraph/igraph_embedding.h:51:3
  structigraphsirt* {.pure, inheritable, bycopy.} = object
    times*: igraphvectort    ## Generated based on /usr/include/igraph/igraph_epidemics.h:54:16
    nos*: igraphvectorintt
    noi*: igraphvectorintt
    nor*: igraphvectorintt

  igraphsirt* = structigraphsirt ## Generated based on /usr/include/igraph/igraph_epidemics.h:57:3
  igraphcoloringgreedyt* = enumigraphcoloringgreedyt ## Generated based on /usr/include/igraph/igraph_coloring.h:49:3
  structigraphbitsetlistt* {.pure, inheritable, bycopy.} = object
    storbegin*: ptr igraphbitsett ## Generated based on /usr/include/igraph/igraph_typed_list_pmt.h:40:9
    storend*: ptr igraphbitsett
    endfield*: ptr igraphbitsett

  structiofile* {.pure, inheritable, bycopy.} = object
    internalflags*: cint     ## Generated based on /usr/include/bits/types/struct_FILE.h:49:8
    internalioreadptr*: cstring
    internalioreadend*: cstring
    internalioreadbase*: cstring
    internaliowritebase*: cstring
    internaliowriteptr*: cstring
    internaliowriteend*: cstring
    internaliobufbase*: cstring
    internaliobufend*: cstring
    internaliosavebase*: cstring
    internaliobackupbase*: cstring
    internaliosaveend*: cstring
    internalmarkers*: ptr structiomarker
    internalchain*: ptr structiofile
    internalfileno*: cint
    internalflags2*: cint
    internaloldoffset*: compilerofft
    internalcurcolumn*: cushort
    internalvtableoffset*: cschar
    internalshortbuf*: array[1'i64, cschar]
    internallock*: pointer
    internaloffset*: compileroff64t
    internalcodecvt*: ptr structiocodecvt
    internalwidedata*: ptr structiowidedata
    internalfreereslist*: ptr structiofile
    internalfreeresbuf*: pointer
    compilerpad5*: csize_t
    internalmode*: cint
    internalunused2*: array[20'i64, cschar]

  compilerofft* = clong      ## Generated based on /usr/include/bits/types.h:152:25
  compileroff64t* = clong    ## Generated based on /usr/include/bits/types.h:153:27
when "0.10.12" is static:
  const
    Igraphversion* = "0.10.12" ## Generated based on /usr/include/igraph/igraph_version.h:31:9
else:
  let Igraphversion* = "0.10.12" ## Generated based on /usr/include/igraph/igraph_version.h:31:9
when 0 is static:
  const
    Igraphversionmajor* = 0  ## Generated based on /usr/include/igraph/igraph_version.h:32:9
else:
  let Igraphversionmajor* = 0 ## Generated based on /usr/include/igraph/igraph_version.h:32:9
when 10 is static:
  const
    Igraphversionminor* = 10 ## Generated based on /usr/include/igraph/igraph_version.h:33:9
else:
  let Igraphversionminor* = 10 ## Generated based on /usr/include/igraph/igraph_version.h:33:9
when 12 is static:
  const
    Igraphversionpatch* = 12 ## Generated based on /usr/include/igraph/igraph_version.h:34:9
else:
  let Igraphversionpatch* = 12 ## Generated based on /usr/include/igraph/igraph_version.h:34:9
when "cmake-experimental" is static:
  const
    Igraphversionprerelease* = "cmake-experimental" ## Generated based on /usr/include/igraph/igraph_version.h:35:9
else:
  let Igraphversionprerelease* = "cmake-experimental" ## Generated based on /usr/include/igraph/igraph_version.h:35:9
when 64 is static:
  const
    Igraphintegersize* = 64  ## Generated based on /usr/include/igraph/igraph_config.h:36:9
else:
  let Igraphintegersize* = 64 ## Generated based on /usr/include/igraph/igraph_config.h:36:9
when "%g" is static:
  const
    Outformat* = "%g"        ## Generated based on /usr/include/igraph/igraph_pmt.h:38:13
else:
  let Outformat* = "%g"      ## Generated based on /usr/include/igraph/igraph_pmt.h:38:13
when 0.0 is static:
  const
    Zero* = 0.0              ## Generated based on /usr/include/igraph/igraph_pmt.h:43:13
else:
  let Zero* = 0.0            ## Generated based on /usr/include/igraph/igraph_pmt.h:43:13
when 1.0 is static:
  const
    One* = 1.0               ## Generated based on /usr/include/igraph/igraph_pmt.h:44:13
else:
  let One* = 1.0             ## Generated based on /usr/include/igraph/igraph_pmt.h:44:13
when 1 is static:
  const
    Multiplicity* = 1        ## Generated based on /usr/include/igraph/igraph_pmt.h:45:13
else:
  let Multiplicity* = 1      ## Generated based on /usr/include/igraph/igraph_pmt.h:45:13
when int is typedesc:
  type
    Short* = int             ## Generated based on /usr/include/igraph/igraph_pmt.h:74:13
else:
  when int is static:
    const
      Short* = int           ## Generated based on /usr/include/igraph/igraph_pmt.h:74:13
  else:
    let Short* = int         ## Generated based on /usr/include/igraph/igraph_pmt.h:74:13
when 1 is static:
  const
    Notordered* = 1          ## Generated based on /usr/include/igraph/igraph_pmt.h:66:13
else:
  let Notordered* = 1        ## Generated based on /usr/include/igraph/igraph_pmt.h:66:13
when 1 is static:
  const
    Noabs* = 1               ## Generated based on /usr/include/igraph/igraph_pmt.h:67:13
else:
  let Noabs* = 1             ## Generated based on /usr/include/igraph/igraph_pmt.h:67:13
when 1 is static:
  const
    Igraphthreadsafe* = 1    ## Generated based on /usr/include/igraph/igraph_threading.h:43:9
else:
  let Igraphthreadsafe* = 1  ## Generated based on /usr/include/igraph/igraph_threading.h:43:9
proc igraphversion*(versionstring: ptr cstring; major: ptr cint;
                    minor: ptr cint; subminor: ptr cint): void {.cdecl,
    importc: "igraph_version".}
proc igraphcallocproc*(count: csize_t; size: csize_t): pointer {.cdecl,
    importc: "igraph_calloc".}
proc igraphmalloc*(size: csize_t): pointer {.cdecl, importc: "igraph_malloc".}
proc igraphreallocproc*(ptrarg: pointer; size: csize_t): pointer {.cdecl,
    importc: "igraph_realloc".}
proc igraphfreeproc*(ptrarg: pointer): void {.cdecl, importc: "igraph_free".}
proc igrapherrorhandlerabort*(a0: cstring; a1: cstring; a2: cint;
                              a3: igrapherrort): void {.cdecl,
    importc: "igraph_error_handler_abort".}
proc igrapherrorhandlerignore*(a0: cstring; a1: cstring; a2: cint;
                               a3: igrapherrort): void {.cdecl,
    importc: "igraph_error_handler_ignore".}
proc igrapherrorhandlerprintignore*(a0: cstring; a1: cstring; a2: cint;
                                    a3: igrapherrort): void {.cdecl,
    importc: "igraph_error_handler_printignore".}
proc igraphseterrorhandler*(newhandler: igrapherrorhandlert): igrapherrorhandlert {.
    cdecl, importc: "igraph_set_error_handler".}
proc igrapherror*(reason: cstring; file: cstring; line: cint;
                  igrapherrno: igrapherrort): igrapherrort {.cdecl,
    importc: "igraph_error".}
proc igrapherrorf*(reason: cstring; file: cstring; line: cint;
                   igrapherrno: igrapherrort): igrapherrort {.cdecl, varargs,
    importc: "igraph_errorf".}
proc igrapherrorvf*(reason: cstring; file: cstring; line: cint;
                    igrapherrno: igrapherrort): igrapherrort {.cdecl, varargs,
    importc: "igraph_errorvf".}
proc igraphstrerror*(igrapherrno: igrapherrort): cstring {.cdecl,
    importc: "igraph_strerror".}
proc Igraphfinallyreal*(funcarg: igraphfinallyfunct; ptrarg: pointer): void {.
    cdecl, importc: "IGRAPH_FINALLY_REAL".}
proc Igraphfinallyclean*(num: cint): void {.cdecl,
    importc: "IGRAPH_FINALLY_CLEAN".}
proc Igraphfinallyfree*(): void {.cdecl, importc: "IGRAPH_FINALLY_FREE".}
proc Igraphfinallyenter*(): void {.cdecl, importc: "IGRAPH_FINALLY_ENTER".}
proc Igraphfinallyexit*(): void {.cdecl, importc: "IGRAPH_FINALLY_EXIT".}
proc Igraphfinallystacksize*(): cint {.cdecl,
                                       importc: "IGRAPH_FINALLY_STACK_SIZE".}
proc igraphsetwarninghandler*(newhandler: igraphwarninghandlert): igraphwarninghandlert {.
    cdecl, importc: "igraph_set_warning_handler".}
proc igraphwarninghandlerignore*(a0: cstring; a1: cstring; a2: cint): void {.
    cdecl, importc: "igraph_warning_handler_ignore".}
proc igraphwarninghandlerprint*(a0: cstring; a1: cstring; a2: cint): void {.
    cdecl, importc: "igraph_warning_handler_print".}
proc igraphwarning*(reason: cstring; file: cstring; line: cint): void {.cdecl,
    importc: "igraph_warning".}
proc igraphwarningf*(reason: cstring; file: cstring; line: cint): void {.cdecl,
    varargs, importc: "igraph_warningf".}
proc igraphsetfatalhandler*(newhandler: igraphfatalhandlert): igraphfatalhandlert {.
    cdecl, importc: "igraph_set_fatal_handler".}
proc igraphfatalhandlerabort*(a0: cstring; a1: cstring; a2: cint): void {.cdecl,
    importc: "igraph_fatal_handler_abort".}
proc igraphfatal*(reason: cstring; file: cstring; line: cint): void {.cdecl,
    importc: "igraph_fatal".}
proc igraphfatalf*(reason: cstring; file: cstring; line: cint): void {.cdecl,
    varargs, importc: "igraph_fatalf".}
proc igraphrealprintf*(val: igraphrealt): cint {.cdecl,
    importc: "igraph_real_printf".}
proc igraphrealfprintf*(file: ptr File; val: igraphrealt): cint {.cdecl,
    importc: "igraph_real_fprintf".}
proc igraphrealprintfaligned*(width: cint; val: igraphrealt): cint {.cdecl,
    importc: "igraph_real_printf_aligned".}
proc igraphrealfprintfaligned*(file: ptr File; width: cint; val: igraphrealt): cint {.
    cdecl, importc: "igraph_real_fprintf_aligned".}
proc igraphrealsnprintf*(str: cstring; size: csize_t; val: igraphrealt): cint {.
    cdecl, importc: "igraph_real_snprintf".}
proc igraphrealprintfprecise*(val: igraphrealt): cint {.cdecl,
    importc: "igraph_real_printf_precise".}
proc igraphrealfprintfprecise*(file: ptr File; val: igraphrealt): cint {.cdecl,
    importc: "igraph_real_fprintf_precise".}
proc igraphrealsnprintfprecise*(str: cstring; size: csize_t; val: igraphrealt): cint {.
    cdecl, importc: "igraph_real_snprintf_precise".}
proc igraphfinite*(x: cdouble): cint {.cdecl, importc: "igraph_finite".}
proc igraphisnan*(x: cdouble): cint {.cdecl, importc: "igraph_is_nan".}
proc igraphisinf*(x: cdouble): cint {.cdecl, importc: "igraph_is_inf".}
proc igraphisposinf*(x: cdouble): cint {.cdecl, importc: "igraph_is_posinf".}
proc igraphisneginf*(x: cdouble): cint {.cdecl, importc: "igraph_is_neginf".}
proc igraphcomplex*(x: igraphrealt; y: igraphrealt): igraphcomplext {.cdecl,
    importc: "igraph_complex".}
proc igraphcomplexpolar*(r: igraphrealt; theta: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_polar".}
proc igraphcomplexeqtol*(z1: igraphcomplext; z2: igraphcomplext;
                         tol: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_complex_eq_tol".}
proc igraphcomplexalmostequals*(z1: igraphcomplext; z2: igraphcomplext;
                                eps: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_complex_almost_equals".}
proc igraphcomplexmod*(z: igraphcomplext): igraphrealt {.cdecl,
    importc: "igraph_complex_mod".}
proc igraphcomplexarg*(z: igraphcomplext): igraphrealt {.cdecl,
    importc: "igraph_complex_arg".}
proc igraphcomplexabs*(z: igraphcomplext): igraphrealt {.cdecl,
    importc: "igraph_complex_abs".}
proc igraphcomplexlogabs*(z: igraphcomplext): igraphrealt {.cdecl,
    importc: "igraph_complex_logabs".}
proc igraphcomplexadd*(z1: igraphcomplext; z2: igraphcomplext): igraphcomplext {.
    cdecl, importc: "igraph_complex_add".}
proc igraphcomplexsub*(z1: igraphcomplext; z2: igraphcomplext): igraphcomplext {.
    cdecl, importc: "igraph_complex_sub".}
proc igraphcomplexmul*(z1: igraphcomplext; z2: igraphcomplext): igraphcomplext {.
    cdecl, importc: "igraph_complex_mul".}
proc igraphcomplexdiv*(z1: igraphcomplext; z2: igraphcomplext): igraphcomplext {.
    cdecl, importc: "igraph_complex_div".}
proc igraphcomplexaddreal*(z: igraphcomplext; x: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_add_real".}
proc igraphcomplexaddimag*(z: igraphcomplext; y: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_add_imag".}
proc igraphcomplexsubreal*(z: igraphcomplext; x: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_sub_real".}
proc igraphcomplexsubimag*(z: igraphcomplext; y: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_sub_imag".}
proc igraphcomplexmulreal*(z: igraphcomplext; x: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_mul_real".}
proc igraphcomplexmulimag*(z: igraphcomplext; y: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_mul_imag".}
proc igraphcomplexdivreal*(z: igraphcomplext; x: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_div_real".}
proc igraphcomplexdivimag*(z: igraphcomplext; y: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_div_imag".}
proc igraphcomplexconj*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_conj".}
proc igraphcomplexneg*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_neg".}
proc igraphcomplexinv*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_inv".}
proc igraphcomplexsqrt*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_sqrt".}
proc igraphcomplexsqrtreal*(x: igraphrealt): igraphcomplext {.cdecl,
    importc: "igraph_complex_sqrt_real".}
proc igraphcomplexexp*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_exp".}
proc igraphcomplexpow*(z1: igraphcomplext; z2: igraphcomplext): igraphcomplext {.
    cdecl, importc: "igraph_complex_pow".}
proc igraphcomplexpowreal*(z: igraphcomplext; x: igraphrealt): igraphcomplext {.
    cdecl, importc: "igraph_complex_pow_real".}
proc igraphcomplexlog*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_log".}
proc igraphcomplexlog10*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_log10".}
proc igraphcomplexlogb*(z: igraphcomplext; b: igraphcomplext): igraphcomplext {.
    cdecl, importc: "igraph_complex_log_b".}
proc igraphcomplexsin*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_sin".}
proc igraphcomplexcos*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_cos".}
proc igraphcomplextan*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_tan".}
proc igraphcomplexsec*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_sec".}
proc igraphcomplexcsc*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_csc".}
proc igraphcomplexcot*(z: igraphcomplext): igraphcomplext {.cdecl,
    importc: "igraph_complex_cot".}
proc igraphcomplexprintf*(val: igraphcomplext): cint {.cdecl,
    importc: "igraph_complex_printf".}
proc igraphcomplexfprintf*(file: ptr File; val: igraphcomplext): cint {.cdecl,
    importc: "igraph_complex_fprintf".}
proc igraphcomplexprintfaligned*(width: cint; val: igraphcomplext): cint {.
    cdecl, importc: "igraph_complex_printf_aligned".}
proc igraphcomplexfprintfaligned*(file: ptr File; width: cint;
                                  val: igraphcomplext): cint {.cdecl,
    importc: "igraph_complex_fprintf_aligned".}
proc igraphcomplexsnprintf*(str: cstring; size: csize_t; val: igraphcomplext): cint {.
    cdecl, importc: "igraph_complex_snprintf".}
proc igraphvectorinit*(v: ptr igraphvectort; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_init".}
proc igraphvectorinitarray*(v: ptr igraphvectort; data: ptr igraphrealt;
                            length: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_init_array".}
proc igraphvectorinitcopy*(to: ptr igraphvectort; fromarg: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_init_copy".}
proc igraphvectorinitrange*(v: ptr igraphvectort; start: igraphrealt;
                            endarg: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_vector_init_range".}
proc igraphvectorinitseq*(v: ptr igraphvectort; fromarg: igraphrealt;
                          to: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_vector_init_seq".}
proc igraphvectorcopy*(to: ptr igraphvectort; fromarg: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_copy".}
proc igraphvectordestroy*(v: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_destroy".}
proc igraphvectorcapacity*(v: ptr igraphvectort): igraphintegert {.cdecl,
    importc: "igraph_vector_capacity".}
proc igraphvectore*(v: ptr igraphvectort; pos: igraphintegert): igraphrealt {.
    cdecl, importc: "igraph_vector_e".}
proc igraphvectoreptr*(v: ptr igraphvectort; pos: igraphintegert): ptr igraphrealt {.
    cdecl, importc: "igraph_vector_e_ptr".}
proc igraphvectorget*(v: ptr igraphvectort; pos: igraphintegert): igraphrealt {.
    cdecl, importc: "igraph_vector_get".}
proc igraphvectorgetptr*(v: ptr igraphvectort; pos: igraphintegert): ptr igraphrealt {.
    cdecl, importc: "igraph_vector_get_ptr".}
proc igraphvectorset*(v: ptr igraphvectort; pos: igraphintegert;
                      value: igraphrealt): void {.cdecl,
    importc: "igraph_vector_set".}
proc igraphvectortail*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_vector_tail".}
proc igraphvectornull*(v: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_null".}
proc igraphvectorfill*(v: ptr igraphvectort; e: igraphrealt): void {.cdecl,
    importc: "igraph_vector_fill".}
proc igraphvectorrange*(v: ptr igraphvectort; start: igraphrealt;
                        endarg: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_vector_range".}
proc igraphvectorview*(v: ptr igraphvectort; data: ptr igraphrealt;
                       length: igraphintegert): ptr igraphvectort {.cdecl,
    importc: "igraph_vector_view".}
proc igraphvectorcopyto*(v: ptr igraphvectort; to: ptr igraphrealt): void {.
    cdecl, importc: "igraph_vector_copy_to".}
proc igraphvectorupdate*(to: ptr igraphvectort; fromarg: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_update".}
proc igraphvectorappend*(to: ptr igraphvectort; fromarg: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_append".}
proc igraphvectorswap*(v1: ptr igraphvectort; v2: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_swap".}
proc igraphvectorswapelements*(v: ptr igraphvectort; i: igraphintegert;
                               j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_swap_elements".}
proc igraphvectorreverse*(v: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_reverse".}
proc igraphvectorpermute*(v: ptr igraphvectort; ind: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_permute".}
proc igraphvectorshuffle*(v: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_shuffle".}
proc igraphvectoraddconstant*(v: ptr igraphvectort; plus: igraphrealt): void {.
    cdecl, importc: "igraph_vector_add_constant".}
proc igraphvectorscale*(v: ptr igraphvectort; by: igraphrealt): void {.cdecl,
    importc: "igraph_vector_scale".}
proc igraphvectoradd*(v1: ptr igraphvectort; v2: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_add".}
proc igraphvectorsub*(v1: ptr igraphvectort; v2: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_sub".}
proc igraphvectormul*(v1: ptr igraphvectort; v2: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_mul".}
proc igraphvectordiv*(v1: ptr igraphvectort; v2: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_div".}
proc igraphvectorcumsum*(to: ptr igraphvectort; fromarg: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_cumsum".}
proc igraphvectorabs*(v: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_abs".}
proc igraphvectoralle*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): igraphboolt {.
    cdecl, importc: "igraph_vector_all_e".}
proc igraphvectoralll*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): igraphboolt {.
    cdecl, importc: "igraph_vector_all_l".}
proc igraphvectorallg*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): igraphboolt {.
    cdecl, importc: "igraph_vector_all_g".}
proc igraphvectorallle*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): igraphboolt {.
    cdecl, importc: "igraph_vector_all_le".}
proc igraphvectorallge*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): igraphboolt {.
    cdecl, importc: "igraph_vector_all_ge".}
proc igraphvectorlexcmp*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): cint {.
    cdecl, importc: "igraph_vector_lex_cmp".}
proc igraphvectorcolexcmp*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): cint {.
    cdecl, importc: "igraph_vector_colex_cmp".}
proc igraphvectorlexcmpuntyped*(lhs: pointer; rhs: pointer): cint {.cdecl,
    importc: "igraph_vector_lex_cmp_untyped".}
proc igraphvectorcolexcmpuntyped*(lhs: pointer; rhs: pointer): cint {.cdecl,
    importc: "igraph_vector_colex_cmp_untyped".}
proc igraphvectormin*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_vector_min".}
proc igraphvectormax*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_vector_max".}
proc igraphvectorwhichmin*(v: ptr igraphvectort): igraphintegert {.cdecl,
    importc: "igraph_vector_which_min".}
proc igraphvectorwhichmax*(v: ptr igraphvectort): igraphintegert {.cdecl,
    importc: "igraph_vector_which_max".}
proc igraphvectorminmax*(v: ptr igraphvectort; min: ptr igraphrealt;
                         max: ptr igraphrealt): void {.cdecl,
    importc: "igraph_vector_minmax".}
proc igraphvectorwhichminmax*(v: ptr igraphvectort;
                              whichmin: ptr igraphintegert;
                              whichmax: ptr igraphintegert): void {.cdecl,
    importc: "igraph_vector_which_minmax".}
proc igraphvectorempty*(v: ptr igraphvectort): igraphboolt {.cdecl,
    importc: "igraph_vector_empty".}
proc igraphvectorsize*(v: ptr igraphvectort): igraphintegert {.cdecl,
    importc: "igraph_vector_size".}
proc igraphvectorisnull*(v: ptr igraphvectort): igraphboolt {.cdecl,
    importc: "igraph_vector_isnull".}
proc igraphvectorsum*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_vector_sum".}
proc igraphvectorsumsq*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_vector_sumsq".}
proc igraphvectorprod*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_vector_prod".}
proc igraphvectorisininterval*(v: ptr igraphvectort; low: igraphrealt;
                               high: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_vector_isininterval".}
proc igraphvectoranysmaller*(v: ptr igraphvectort; limit: igraphrealt): igraphboolt {.
    cdecl, importc: "igraph_vector_any_smaller".}
proc igraphvectorisequal*(lhs: ptr igraphvectort; rhs: ptr igraphvectort): igraphboolt {.
    cdecl, importc: "igraph_vector_is_equal".}
proc igraphvectormaxdifference*(m1: ptr igraphvectort; m2: ptr igraphvectort): igraphrealt {.
    cdecl, importc: "igraph_vector_maxdifference".}
proc igraphvectorcontains*(v: ptr igraphvectort; e: igraphrealt): igraphboolt {.
    cdecl, importc: "igraph_vector_contains".}
proc igraphvectorsearch*(v: ptr igraphvectort; fromarg: igraphintegert;
                         what: igraphrealt; pos: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_search".}
proc igraphvectorbinsearchslice*(v: ptr igraphvectort; what: igraphrealt;
                                 pos: ptr igraphintegert; start: igraphintegert;
                                 endarg: igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_vector_binsearch_slice".}
proc igraphvectorbinsearch*(v: ptr igraphvectort; what: igraphrealt;
                            pos: ptr igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_vector_binsearch".}
proc igraphvectorbinsearch2*(v: ptr igraphvectort; what: igraphrealt): igraphboolt {.
    cdecl, importc: "igraph_vector_binsearch2".}
proc igraphvectorclear*(v: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_clear".}
proc igraphvectorresize*(v: ptr igraphvectort; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_resize".}
proc igraphvectorresizemin*(v: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_resize_min".}
proc igraphvectorreserve*(v: ptr igraphvectort; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_reserve".}
proc igraphvectorpushback*(v: ptr igraphvectort; e: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_vector_push_back".}
proc igraphvectorpopback*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_vector_pop_back".}
proc igraphvectorinsert*(v: ptr igraphvectort; pos: igraphintegert;
                         value: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_vector_insert".}
proc igraphvectorremove*(v: ptr igraphvectort; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_remove".}
proc igraphvectorremovefast*(v: ptr igraphvectort; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_remove_fast".}
proc igraphvectorremovesection*(v: ptr igraphvectort; fromarg: igraphintegert;
                                to: igraphintegert): void {.cdecl,
    importc: "igraph_vector_remove_section".}
proc igraphvectorsort*(v: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_sort".}
proc igraphvectorreversesort*(v: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_reverse_sort".}
proc igraphvectorqsortind*(v: ptr igraphvectort; inds: ptr igraphvectorintt;
                           order: igraphordert): igrapherrort {.cdecl,
    importc: "igraph_vector_qsort_ind".}
proc igraphvectorprint*(v: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_print".}
proc igraphvectorfprint*(v: ptr igraphvectort; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_vector_fprint".}
proc igraphvectorprintf*(v: ptr igraphvectort; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_vector_printf".}
proc igraphvectorinitreal*(v: ptr igraphvectort; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_init_real".}
proc igraphvectorinitint*(v: ptr igraphvectort; no: cint): igrapherrort {.cdecl,
    varargs, importc: "igraph_vector_init_int".}
proc igraphvectorinitrealend*(v: ptr igraphvectort; endmark: cdouble): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_init_real_end".}
proc igraphvectorinitintend*(v: ptr igraphvectort; endmark: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_init_int_end".}
proc igraphvectormoveinterval*(v: ptr igraphvectort; begin: igraphintegert;
                               endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_move_interval".}
proc igraphvectormoveinterval2*(v: ptr igraphvectort; begin: igraphintegert;
                                endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_move_interval2".}
proc igraphvectorfiltersmaller*(v: ptr igraphvectort; elem: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_vector_filter_smaller".}
proc igraphvectorgetinterval*(v: ptr igraphvectort; res: ptr igraphvectort;
                              fromarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_get_interval".}
proc igraphvectordifferencesorted*(v1: ptr igraphvectort; v2: ptr igraphvectort;
                                   result: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_difference_sorted".}
proc igraphvectorintersectsorted*(v1: ptr igraphvectort; v2: ptr igraphvectort;
                                  result: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_intersect_sorted".}
proc igraphvectorindex*(v: ptr igraphvectort; newv: ptr igraphvectort;
                        idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_index".}
proc igraphvectorindexint*(v: ptr igraphvectort; idx: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_index_int".}
proc igraphvectorcharinit*(v: ptr igraphvectorchart; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_char_init".}
proc igraphvectorcharinitarray*(v: ptr igraphvectorchart; data: cstring;
                                length: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_char_init_array".}
proc igraphvectorcharinitcopy*(to: ptr igraphvectorchart;
                               fromarg: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_init_copy".}
proc igraphvectorcharinitrange*(v: ptr igraphvectorchart; start: cschar;
                                endarg: cschar): igrapherrort {.cdecl,
    importc: "igraph_vector_char_init_range".}
proc igraphvectorcharinitseq*(v: ptr igraphvectorchart; fromarg: cschar;
                              to: cschar): igrapherrort {.cdecl,
    importc: "igraph_vector_char_init_seq".}
proc igraphvectorcharcopy*(to: ptr igraphvectorchart;
                           fromarg: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_copy".}
proc igraphvectorchardestroy*(v: ptr igraphvectorchart): void {.cdecl,
    importc: "igraph_vector_char_destroy".}
proc igraphvectorcharcapacity*(v: ptr igraphvectorchart): igraphintegert {.
    cdecl, importc: "igraph_vector_char_capacity".}
proc igraphvectorchare*(v: ptr igraphvectorchart; pos: igraphintegert): cschar {.
    cdecl, importc: "igraph_vector_char_e".}
proc igraphvectorchareptr*(v: ptr igraphvectorchart; pos: igraphintegert): cstring {.
    cdecl, importc: "igraph_vector_char_e_ptr".}
proc igraphvectorcharget*(v: ptr igraphvectorchart; pos: igraphintegert): cschar {.
    cdecl, importc: "igraph_vector_char_get".}
proc igraphvectorchargetptr*(v: ptr igraphvectorchart; pos: igraphintegert): cstring {.
    cdecl, importc: "igraph_vector_char_get_ptr".}
proc igraphvectorcharset*(v: ptr igraphvectorchart; pos: igraphintegert;
                          value: cschar): void {.cdecl,
    importc: "igraph_vector_char_set".}
proc igraphvectorchartail*(v: ptr igraphvectorchart): cschar {.cdecl,
    importc: "igraph_vector_char_tail".}
proc igraphvectorcharnull*(v: ptr igraphvectorchart): void {.cdecl,
    importc: "igraph_vector_char_null".}
proc igraphvectorcharfill*(v: ptr igraphvectorchart; e: cschar): void {.cdecl,
    importc: "igraph_vector_char_fill".}
proc igraphvectorcharrange*(v: ptr igraphvectorchart; start: cschar;
                            endarg: cschar): igrapherrort {.cdecl,
    importc: "igraph_vector_char_range".}
proc igraphvectorcharview*(v: ptr igraphvectorchart; data: cstring;
                           length: igraphintegert): ptr igraphvectorchart {.
    cdecl, importc: "igraph_vector_char_view".}
proc igraphvectorcharcopyto*(v: ptr igraphvectorchart; to: cstring): void {.
    cdecl, importc: "igraph_vector_char_copy_to".}
proc igraphvectorcharupdate*(to: ptr igraphvectorchart;
                             fromarg: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_update".}
proc igraphvectorcharappend*(to: ptr igraphvectorchart;
                             fromarg: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_append".}
proc igraphvectorcharswap*(v1: ptr igraphvectorchart; v2: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_swap".}
proc igraphvectorcharswapelements*(v: ptr igraphvectorchart; i: igraphintegert;
                                   j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_char_swap_elements".}
proc igraphvectorcharreverse*(v: ptr igraphvectorchart): igrapherrort {.cdecl,
    importc: "igraph_vector_char_reverse".}
proc igraphvectorcharpermute*(v: ptr igraphvectorchart;
                              ind: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_char_permute".}
proc igraphvectorcharshuffle*(v: ptr igraphvectorchart): igrapherrort {.cdecl,
    importc: "igraph_vector_char_shuffle".}
proc igraphvectorcharaddconstant*(v: ptr igraphvectorchart; plus: cschar): void {.
    cdecl, importc: "igraph_vector_char_add_constant".}
proc igraphvectorcharscale*(v: ptr igraphvectorchart; by: cschar): void {.cdecl,
    importc: "igraph_vector_char_scale".}
proc igraphvectorcharadd*(v1: ptr igraphvectorchart; v2: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_add".}
proc igraphvectorcharsub*(v1: ptr igraphvectorchart; v2: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_sub".}
proc igraphvectorcharmul*(v1: ptr igraphvectorchart; v2: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_mul".}
proc igraphvectorchardiv*(v1: ptr igraphvectorchart; v2: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_div".}
proc igraphvectorcharcumsum*(to: ptr igraphvectorchart;
                             fromarg: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_cumsum".}
proc igraphvectorcharabs*(v: ptr igraphvectorchart): igrapherrort {.cdecl,
    importc: "igraph_vector_char_abs".}
proc igraphvectorcharalle*(lhs: ptr igraphvectorchart;
                           rhs: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_all_e".}
proc igraphvectorcharalll*(lhs: ptr igraphvectorchart;
                           rhs: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_all_l".}
proc igraphvectorcharallg*(lhs: ptr igraphvectorchart;
                           rhs: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_all_g".}
proc igraphvectorcharallle*(lhs: ptr igraphvectorchart;
                            rhs: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_all_le".}
proc igraphvectorcharallge*(lhs: ptr igraphvectorchart;
                            rhs: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_all_ge".}
proc igraphvectorcharlexcmp*(lhs: ptr igraphvectorchart;
                             rhs: ptr igraphvectorchart): cint {.cdecl,
    importc: "igraph_vector_char_lex_cmp".}
proc igraphvectorcharcolexcmp*(lhs: ptr igraphvectorchart;
                               rhs: ptr igraphvectorchart): cint {.cdecl,
    importc: "igraph_vector_char_colex_cmp".}
proc igraphvectorcharlexcmpuntyped*(lhs: pointer; rhs: pointer): cint {.cdecl,
    importc: "igraph_vector_char_lex_cmp_untyped".}
proc igraphvectorcharcolexcmpuntyped*(lhs: pointer; rhs: pointer): cint {.cdecl,
    importc: "igraph_vector_char_colex_cmp_untyped".}
proc igraphvectorcharmin*(v: ptr igraphvectorchart): cschar {.cdecl,
    importc: "igraph_vector_char_min".}
proc igraphvectorcharmax*(v: ptr igraphvectorchart): cschar {.cdecl,
    importc: "igraph_vector_char_max".}
proc igraphvectorcharwhichmin*(v: ptr igraphvectorchart): igraphintegert {.
    cdecl, importc: "igraph_vector_char_which_min".}
proc igraphvectorcharwhichmax*(v: ptr igraphvectorchart): igraphintegert {.
    cdecl, importc: "igraph_vector_char_which_max".}
proc igraphvectorcharminmax*(v: ptr igraphvectorchart; min: cstring;
                             max: cstring): void {.cdecl,
    importc: "igraph_vector_char_minmax".}
proc igraphvectorcharwhichminmax*(v: ptr igraphvectorchart;
                                  whichmin: ptr igraphintegert;
                                  whichmax: ptr igraphintegert): void {.cdecl,
    importc: "igraph_vector_char_which_minmax".}
proc igraphvectorcharempty*(v: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_empty".}
proc igraphvectorcharsize*(v: ptr igraphvectorchart): igraphintegert {.cdecl,
    importc: "igraph_vector_char_size".}
proc igraphvectorcharisnull*(v: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_isnull".}
proc igraphvectorcharsum*(v: ptr igraphvectorchart): cschar {.cdecl,
    importc: "igraph_vector_char_sum".}
proc igraphvectorcharsumsq*(v: ptr igraphvectorchart): igraphrealt {.cdecl,
    importc: "igraph_vector_char_sumsq".}
proc igraphvectorcharprod*(v: ptr igraphvectorchart): cschar {.cdecl,
    importc: "igraph_vector_char_prod".}
proc igraphvectorcharisininterval*(v: ptr igraphvectorchart; low: cschar;
                                   high: cschar): igraphboolt {.cdecl,
    importc: "igraph_vector_char_isininterval".}
proc igraphvectorcharanysmaller*(v: ptr igraphvectorchart; limit: cschar): igraphboolt {.
    cdecl, importc: "igraph_vector_char_any_smaller".}
proc igraphvectorcharisequal*(lhs: ptr igraphvectorchart;
                              rhs: ptr igraphvectorchart): igraphboolt {.cdecl,
    importc: "igraph_vector_char_is_equal".}
proc igraphvectorcharmaxdifference*(m1: ptr igraphvectorchart;
                                    m2: ptr igraphvectorchart): igraphrealt {.
    cdecl, importc: "igraph_vector_char_maxdifference".}
proc igraphvectorcharcontains*(v: ptr igraphvectorchart; e: cschar): igraphboolt {.
    cdecl, importc: "igraph_vector_char_contains".}
proc igraphvectorcharsearch*(v: ptr igraphvectorchart; fromarg: igraphintegert;
                             what: cschar; pos: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_char_search".}
proc igraphvectorcharbinsearchslice*(v: ptr igraphvectorchart; what: cschar;
                                     pos: ptr igraphintegert;
                                     start: igraphintegert;
                                     endarg: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_char_binsearch_slice".}
proc igraphvectorcharbinsearch*(v: ptr igraphvectorchart; what: cschar;
                                pos: ptr igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_vector_char_binsearch".}
proc igraphvectorcharbinsearch2*(v: ptr igraphvectorchart; what: cschar): igraphboolt {.
    cdecl, importc: "igraph_vector_char_binsearch2".}
proc igraphvectorcharclear*(v: ptr igraphvectorchart): void {.cdecl,
    importc: "igraph_vector_char_clear".}
proc igraphvectorcharresize*(v: ptr igraphvectorchart; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_char_resize".}
proc igraphvectorcharresizemin*(v: ptr igraphvectorchart): void {.cdecl,
    importc: "igraph_vector_char_resize_min".}
proc igraphvectorcharreserve*(v: ptr igraphvectorchart; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_char_reserve".}
proc igraphvectorcharpushback*(v: ptr igraphvectorchart; e: cschar): igrapherrort {.
    cdecl, importc: "igraph_vector_char_push_back".}
proc igraphvectorcharpopback*(v: ptr igraphvectorchart): cschar {.cdecl,
    importc: "igraph_vector_char_pop_back".}
proc igraphvectorcharinsert*(v: ptr igraphvectorchart; pos: igraphintegert;
                             value: cschar): igrapherrort {.cdecl,
    importc: "igraph_vector_char_insert".}
proc igraphvectorcharremove*(v: ptr igraphvectorchart; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_char_remove".}
proc igraphvectorcharremovefast*(v: ptr igraphvectorchart; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_char_remove_fast".}
proc igraphvectorcharremovesection*(v: ptr igraphvectorchart;
                                    fromarg: igraphintegert; to: igraphintegert): void {.
    cdecl, importc: "igraph_vector_char_remove_section".}
proc igraphvectorcharsort*(v: ptr igraphvectorchart): void {.cdecl,
    importc: "igraph_vector_char_sort".}
proc igraphvectorcharreversesort*(v: ptr igraphvectorchart): void {.cdecl,
    importc: "igraph_vector_char_reverse_sort".}
proc igraphvectorcharqsortind*(v: ptr igraphvectorchart;
                               inds: ptr igraphvectorintt; order: igraphordert): igrapherrort {.
    cdecl, importc: "igraph_vector_char_qsort_ind".}
proc igraphvectorcharprint*(v: ptr igraphvectorchart): igrapherrort {.cdecl,
    importc: "igraph_vector_char_print".}
proc igraphvectorcharfprint*(v: ptr igraphvectorchart; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_vector_char_fprint".}
proc igraphvectorcharprintf*(v: ptr igraphvectorchart; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_vector_char_printf".}
proc igraphvectorcharinitreal*(v: ptr igraphvectorchart; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_char_init_real".}
proc igraphvectorcharinitint*(v: ptr igraphvectorchart; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_char_init_int".}
proc igraphvectorcharinitrealend*(v: ptr igraphvectorchart; endmark: cdouble): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_char_init_real_end".}
proc igraphvectorcharinitintend*(v: ptr igraphvectorchart; endmark: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_char_init_int_end".}
proc igraphvectorcharmoveinterval*(v: ptr igraphvectorchart;
                                   begin: igraphintegert;
                                   endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_char_move_interval".}
proc igraphvectorcharmoveinterval2*(v: ptr igraphvectorchart;
                                    begin: igraphintegert;
                                    endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_char_move_interval2".}
proc igraphvectorcharfiltersmaller*(v: ptr igraphvectorchart; elem: cschar): igrapherrort {.
    cdecl, importc: "igraph_vector_char_filter_smaller".}
proc igraphvectorchargetinterval*(v: ptr igraphvectorchart;
                                  res: ptr igraphvectorchart;
                                  fromarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_char_get_interval".}
proc igraphvectorchardifferencesorted*(v1: ptr igraphvectorchart;
                                       v2: ptr igraphvectorchart;
                                       result: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_difference_sorted".}
proc igraphvectorcharintersectsorted*(v1: ptr igraphvectorchart;
                                      v2: ptr igraphvectorchart;
                                      result: ptr igraphvectorchart): igrapherrort {.
    cdecl, importc: "igraph_vector_char_intersect_sorted".}
proc igraphvectorcharindex*(v: ptr igraphvectorchart;
                            newv: ptr igraphvectorchart;
                            idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_char_index".}
proc igraphvectorcharindexint*(v: ptr igraphvectorchart;
                               idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_char_index_int".}
proc igraphvectorboolinit*(v: ptr igraphvectorboolt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_init".}
proc igraphvectorboolinitarray*(v: ptr igraphvectorboolt; data: ptr igraphboolt;
                                length: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_init_array".}
proc igraphvectorboolinitcopy*(to: ptr igraphvectorboolt;
                               fromarg: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_init_copy".}
proc igraphvectorboolcopy*(to: ptr igraphvectorboolt;
                           fromarg: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_copy".}
proc igraphvectorbooldestroy*(v: ptr igraphvectorboolt): void {.cdecl,
    importc: "igraph_vector_bool_destroy".}
proc igraphvectorboolcapacity*(v: ptr igraphvectorboolt): igraphintegert {.
    cdecl, importc: "igraph_vector_bool_capacity".}
proc igraphvectorboole*(v: ptr igraphvectorboolt; pos: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_bool_e".}
proc igraphvectorbooleptr*(v: ptr igraphvectorboolt; pos: igraphintegert): ptr igraphboolt {.
    cdecl, importc: "igraph_vector_bool_e_ptr".}
proc igraphvectorboolget*(v: ptr igraphvectorboolt; pos: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_bool_get".}
proc igraphvectorboolgetptr*(v: ptr igraphvectorboolt; pos: igraphintegert): ptr igraphboolt {.
    cdecl, importc: "igraph_vector_bool_get_ptr".}
proc igraphvectorboolset*(v: ptr igraphvectorboolt; pos: igraphintegert;
                          value: igraphboolt): void {.cdecl,
    importc: "igraph_vector_bool_set".}
proc igraphvectorbooltail*(v: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_tail".}
proc igraphvectorboolnull*(v: ptr igraphvectorboolt): void {.cdecl,
    importc: "igraph_vector_bool_null".}
proc igraphvectorboolfill*(v: ptr igraphvectorboolt; e: igraphboolt): void {.
    cdecl, importc: "igraph_vector_bool_fill".}
proc igraphvectorboolview*(v: ptr igraphvectorboolt; data: ptr igraphboolt;
                           length: igraphintegert): ptr igraphvectorboolt {.
    cdecl, importc: "igraph_vector_bool_view".}
proc igraphvectorboolcopyto*(v: ptr igraphvectorboolt; to: ptr igraphboolt): void {.
    cdecl, importc: "igraph_vector_bool_copy_to".}
proc igraphvectorboolupdate*(to: ptr igraphvectorboolt;
                             fromarg: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_update".}
proc igraphvectorboolappend*(to: ptr igraphvectorboolt;
                             fromarg: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_append".}
proc igraphvectorboolswap*(v1: ptr igraphvectorboolt; v2: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_swap".}
proc igraphvectorboolswapelements*(v: ptr igraphvectorboolt; i: igraphintegert;
                                   j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_swap_elements".}
proc igraphvectorboolreverse*(v: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_reverse".}
proc igraphvectorboolpermute*(v: ptr igraphvectorboolt;
                              ind: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_permute".}
proc igraphvectorboolshuffle*(v: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_shuffle".}
proc igraphvectorbooladdconstant*(v: ptr igraphvectorboolt; plus: igraphboolt): void {.
    cdecl, importc: "igraph_vector_bool_add_constant".}
proc igraphvectorboolscale*(v: ptr igraphvectorboolt; by: igraphboolt): void {.
    cdecl, importc: "igraph_vector_bool_scale".}
proc igraphvectorbooladd*(v1: ptr igraphvectorboolt; v2: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_add".}
proc igraphvectorboolsub*(v1: ptr igraphvectorboolt; v2: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_sub".}
proc igraphvectorboolmul*(v1: ptr igraphvectorboolt; v2: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_mul".}
proc igraphvectorbooldiv*(v1: ptr igraphvectorboolt; v2: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_div".}
proc igraphvectorboolcumsum*(to: ptr igraphvectorboolt;
                             fromarg: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_cumsum".}
proc igraphvectorboolalle*(lhs: ptr igraphvectorboolt;
                           rhs: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_all_e".}
proc igraphvectorboolempty*(v: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_empty".}
proc igraphvectorboolsize*(v: ptr igraphvectorboolt): igraphintegert {.cdecl,
    importc: "igraph_vector_bool_size".}
proc igraphvectorboolisnull*(v: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_isnull".}
proc igraphvectorboolsum*(v: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_sum".}
proc igraphvectorboolsumsq*(v: ptr igraphvectorboolt): igraphrealt {.cdecl,
    importc: "igraph_vector_bool_sumsq".}
proc igraphvectorboolprod*(v: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_prod".}
proc igraphvectorboolisequal*(lhs: ptr igraphvectorboolt;
                              rhs: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_is_equal".}
proc igraphvectorboolcontains*(v: ptr igraphvectorboolt; e: igraphboolt): igraphboolt {.
    cdecl, importc: "igraph_vector_bool_contains".}
proc igraphvectorboolsearch*(v: ptr igraphvectorboolt; fromarg: igraphintegert;
                             what: igraphboolt; pos: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_bool_search".}
proc igraphvectorboolclear*(v: ptr igraphvectorboolt): void {.cdecl,
    importc: "igraph_vector_bool_clear".}
proc igraphvectorboolresize*(v: ptr igraphvectorboolt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_resize".}
proc igraphvectorboolresizemin*(v: ptr igraphvectorboolt): void {.cdecl,
    importc: "igraph_vector_bool_resize_min".}
proc igraphvectorboolreserve*(v: ptr igraphvectorboolt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_reserve".}
proc igraphvectorboolpushback*(v: ptr igraphvectorboolt; e: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_push_back".}
proc igraphvectorboolpopback*(v: ptr igraphvectorboolt): igraphboolt {.cdecl,
    importc: "igraph_vector_bool_pop_back".}
proc igraphvectorboolinsert*(v: ptr igraphvectorboolt; pos: igraphintegert;
                             value: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_insert".}
proc igraphvectorboolremove*(v: ptr igraphvectorboolt; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_bool_remove".}
proc igraphvectorboolremovefast*(v: ptr igraphvectorboolt; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_bool_remove_fast".}
proc igraphvectorboolremovesection*(v: ptr igraphvectorboolt;
                                    fromarg: igraphintegert; to: igraphintegert): void {.
    cdecl, importc: "igraph_vector_bool_remove_section".}
proc igraphvectorboolprint*(v: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_print".}
proc igraphvectorboolfprint*(v: ptr igraphvectorboolt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_fprint".}
proc igraphvectorboolprintf*(v: ptr igraphvectorboolt; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_printf".}
proc igraphvectorboolinitreal*(v: ptr igraphvectorboolt; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_bool_init_real".}
proc igraphvectorboolinitint*(v: ptr igraphvectorboolt; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_bool_init_int".}
proc igraphvectorboolinitrealend*(v: ptr igraphvectorboolt; endmark: cdouble): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_bool_init_real_end".}
proc igraphvectorboolinitintend*(v: ptr igraphvectorboolt; endmark: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_bool_init_int_end".}
proc igraphvectorboolmoveinterval*(v: ptr igraphvectorboolt;
                                   begin: igraphintegert;
                                   endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_move_interval".}
proc igraphvectorboolmoveinterval2*(v: ptr igraphvectorboolt;
                                    begin: igraphintegert;
                                    endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_move_interval2".}
proc igraphvectorboolgetinterval*(v: ptr igraphvectorboolt;
                                  res: ptr igraphvectorboolt;
                                  fromarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_bool_get_interval".}
proc igraphvectorboolindex*(v: ptr igraphvectorboolt;
                            newv: ptr igraphvectorboolt;
                            idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_index".}
proc igraphvectorboolindexint*(v: ptr igraphvectorboolt;
                               idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_bool_index_int".}
proc igraphvectorintinit*(v: ptr igraphvectorintt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_init".}
proc igraphvectorintinitarray*(v: ptr igraphvectorintt;
                               data: ptr igraphintegert; length: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_init_array".}
proc igraphvectorintinitcopy*(to: ptr igraphvectorintt;
                              fromarg: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_init_copy".}
proc igraphvectorintinitrange*(v: ptr igraphvectorintt; start: igraphintegert;
                               endarg: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_init_range".}
proc igraphvectorintinitseq*(v: ptr igraphvectorintt; fromarg: igraphintegert;
                             to: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_init_seq".}
proc igraphvectorintcopy*(to: ptr igraphvectorintt;
                          fromarg: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_int_copy".}
proc igraphvectorintdestroy*(v: ptr igraphvectorintt): void {.cdecl,
    importc: "igraph_vector_int_destroy".}
proc igraphvectorintcapacity*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_capacity".}
proc igraphvectorinte*(v: ptr igraphvectorintt; pos: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_vector_int_e".}
proc igraphvectorinteptr*(v: ptr igraphvectorintt; pos: igraphintegert): ptr igraphintegert {.
    cdecl, importc: "igraph_vector_int_e_ptr".}
proc igraphvectorintget*(v: ptr igraphvectorintt; pos: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_vector_int_get".}
proc igraphvectorintgetptr*(v: ptr igraphvectorintt; pos: igraphintegert): ptr igraphintegert {.
    cdecl, importc: "igraph_vector_int_get_ptr".}
proc igraphvectorintset*(v: ptr igraphvectorintt; pos: igraphintegert;
                         value: igraphintegert): void {.cdecl,
    importc: "igraph_vector_int_set".}
proc igraphvectorinttail*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_tail".}
proc igraphvectorintnull*(v: ptr igraphvectorintt): void {.cdecl,
    importc: "igraph_vector_int_null".}
proc igraphvectorintfill*(v: ptr igraphvectorintt; e: igraphintegert): void {.
    cdecl, importc: "igraph_vector_int_fill".}
proc igraphvectorintrange*(v: ptr igraphvectorintt; start: igraphintegert;
                           endarg: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_range".}
proc igraphvectorintview*(v: ptr igraphvectorintt; data: ptr igraphintegert;
                          length: igraphintegert): ptr igraphvectorintt {.cdecl,
    importc: "igraph_vector_int_view".}
proc igraphvectorintcopyto*(v: ptr igraphvectorintt; to: ptr igraphintegert): void {.
    cdecl, importc: "igraph_vector_int_copy_to".}
proc igraphvectorintupdate*(to: ptr igraphvectorintt;
                            fromarg: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_update".}
proc igraphvectorintappend*(to: ptr igraphvectorintt;
                            fromarg: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_append".}
proc igraphvectorintswap*(v1: ptr igraphvectorintt; v2: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_swap".}
proc igraphvectorintswapelements*(v: ptr igraphvectorintt; i: igraphintegert;
                                  j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_swap_elements".}
proc igraphvectorintreverse*(v: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_int_reverse".}
proc igraphvectorintpermute*(v: ptr igraphvectorintt; ind: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_permute".}
proc igraphvectorintshuffle*(v: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_int_shuffle".}
proc igraphvectorintaddconstant*(v: ptr igraphvectorintt; plus: igraphintegert): void {.
    cdecl, importc: "igraph_vector_int_add_constant".}
proc igraphvectorintscale*(v: ptr igraphvectorintt; by: igraphintegert): void {.
    cdecl, importc: "igraph_vector_int_scale".}
proc igraphvectorintadd*(v1: ptr igraphvectorintt; v2: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_add".}
proc igraphvectorintsub*(v1: ptr igraphvectorintt; v2: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_sub".}
proc igraphvectorintmul*(v1: ptr igraphvectorintt; v2: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_mul".}
proc igraphvectorintdiv*(v1: ptr igraphvectorintt; v2: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_div".}
proc igraphvectorintcumsum*(to: ptr igraphvectorintt;
                            fromarg: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_cumsum".}
proc igraphvectorintabs*(v: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_int_abs".}
proc igraphvectorintalle*(lhs: ptr igraphvectorintt; rhs: ptr igraphvectorintt): igraphboolt {.
    cdecl, importc: "igraph_vector_int_all_e".}
proc igraphvectorintalll*(lhs: ptr igraphvectorintt; rhs: ptr igraphvectorintt): igraphboolt {.
    cdecl, importc: "igraph_vector_int_all_l".}
proc igraphvectorintallg*(lhs: ptr igraphvectorintt; rhs: ptr igraphvectorintt): igraphboolt {.
    cdecl, importc: "igraph_vector_int_all_g".}
proc igraphvectorintallle*(lhs: ptr igraphvectorintt; rhs: ptr igraphvectorintt): igraphboolt {.
    cdecl, importc: "igraph_vector_int_all_le".}
proc igraphvectorintallge*(lhs: ptr igraphvectorintt; rhs: ptr igraphvectorintt): igraphboolt {.
    cdecl, importc: "igraph_vector_int_all_ge".}
proc igraphvectorintlexcmp*(lhs: ptr igraphvectorintt; rhs: ptr igraphvectorintt): cint {.
    cdecl, importc: "igraph_vector_int_lex_cmp".}
proc igraphvectorintcolexcmp*(lhs: ptr igraphvectorintt;
                              rhs: ptr igraphvectorintt): cint {.cdecl,
    importc: "igraph_vector_int_colex_cmp".}
proc igraphvectorintlexcmpuntyped*(lhs: pointer; rhs: pointer): cint {.cdecl,
    importc: "igraph_vector_int_lex_cmp_untyped".}
proc igraphvectorintcolexcmpuntyped*(lhs: pointer; rhs: pointer): cint {.cdecl,
    importc: "igraph_vector_int_colex_cmp_untyped".}
proc igraphvectorintmin*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_min".}
proc igraphvectorintmax*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_max".}
proc igraphvectorintwhichmin*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_which_min".}
proc igraphvectorintwhichmax*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_which_max".}
proc igraphvectorintminmax*(v: ptr igraphvectorintt; min: ptr igraphintegert;
                            max: ptr igraphintegert): void {.cdecl,
    importc: "igraph_vector_int_minmax".}
proc igraphvectorintwhichminmax*(v: ptr igraphvectorintt;
                                 whichmin: ptr igraphintegert;
                                 whichmax: ptr igraphintegert): void {.cdecl,
    importc: "igraph_vector_int_which_minmax".}
proc igraphvectorintempty*(v: ptr igraphvectorintt): igraphboolt {.cdecl,
    importc: "igraph_vector_int_empty".}
proc igraphvectorintsize*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_size".}
proc igraphvectorintisnull*(v: ptr igraphvectorintt): igraphboolt {.cdecl,
    importc: "igraph_vector_int_isnull".}
proc igraphvectorintsum*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_sum".}
proc igraphvectorintsumsq*(v: ptr igraphvectorintt): igraphrealt {.cdecl,
    importc: "igraph_vector_int_sumsq".}
proc igraphvectorintprod*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_prod".}
proc igraphvectorintisininterval*(v: ptr igraphvectorintt; low: igraphintegert;
                                  high: igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_vector_int_isininterval".}
proc igraphvectorintanysmaller*(v: ptr igraphvectorintt; limit: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_int_any_smaller".}
proc igraphvectorintisequal*(lhs: ptr igraphvectorintt;
                             rhs: ptr igraphvectorintt): igraphboolt {.cdecl,
    importc: "igraph_vector_int_is_equal".}
proc igraphvectorintmaxdifference*(m1: ptr igraphvectorintt;
                                   m2: ptr igraphvectorintt): igraphrealt {.
    cdecl, importc: "igraph_vector_int_maxdifference".}
proc igraphvectorintcontains*(v: ptr igraphvectorintt; e: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_int_contains".}
proc igraphvectorintsearch*(v: ptr igraphvectorintt; fromarg: igraphintegert;
                            what: igraphintegert; pos: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_int_search".}
proc igraphvectorintbinsearchslice*(v: ptr igraphvectorintt;
                                    what: igraphintegert;
                                    pos: ptr igraphintegert;
                                    start: igraphintegert;
                                    endarg: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_int_binsearch_slice".}
proc igraphvectorintbinsearch*(v: ptr igraphvectorintt; what: igraphintegert;
                               pos: ptr igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_vector_int_binsearch".}
proc igraphvectorintbinsearch2*(v: ptr igraphvectorintt; what: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_vector_int_binsearch2".}
proc igraphvectorintclear*(v: ptr igraphvectorintt): void {.cdecl,
    importc: "igraph_vector_int_clear".}
proc igraphvectorintresize*(v: ptr igraphvectorintt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_resize".}
proc igraphvectorintresizemin*(v: ptr igraphvectorintt): void {.cdecl,
    importc: "igraph_vector_int_resize_min".}
proc igraphvectorintreserve*(v: ptr igraphvectorintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_reserve".}
proc igraphvectorintpushback*(v: ptr igraphvectorintt; e: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_push_back".}
proc igraphvectorintpopback*(v: ptr igraphvectorintt): igraphintegert {.cdecl,
    importc: "igraph_vector_int_pop_back".}
proc igraphvectorintinsert*(v: ptr igraphvectorintt; pos: igraphintegert;
                            value: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_insert".}
proc igraphvectorintremove*(v: ptr igraphvectorintt; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_int_remove".}
proc igraphvectorintremovefast*(v: ptr igraphvectorintt; elem: igraphintegert): void {.
    cdecl, importc: "igraph_vector_int_remove_fast".}
proc igraphvectorintremovesection*(v: ptr igraphvectorintt;
                                   fromarg: igraphintegert; to: igraphintegert): void {.
    cdecl, importc: "igraph_vector_int_remove_section".}
proc igraphvectorintsort*(v: ptr igraphvectorintt): void {.cdecl,
    importc: "igraph_vector_int_sort".}
proc igraphvectorintreversesort*(v: ptr igraphvectorintt): void {.cdecl,
    importc: "igraph_vector_int_reverse_sort".}
proc igraphvectorintqsortind*(v: ptr igraphvectorintt;
                              inds: ptr igraphvectorintt; order: igraphordert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_qsort_ind".}
proc igraphvectorintprint*(v: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_int_print".}
proc igraphvectorintfprint*(v: ptr igraphvectorintt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_vector_int_fprint".}
proc igraphvectorintprintf*(v: ptr igraphvectorintt; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_vector_int_printf".}
proc igraphvectorintinitreal*(v: ptr igraphvectorintt; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_int_init_real".}
proc igraphvectorintinitint*(v: ptr igraphvectorintt; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_int_init_int".}
proc igraphvectorintinitrealend*(v: ptr igraphvectorintt; endmark: cdouble): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_int_init_real_end".}
proc igraphvectorintinitintend*(v: ptr igraphvectorintt; endmark: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_int_init_int_end".}
proc igraphvectorintmoveinterval*(v: ptr igraphvectorintt;
                                  begin: igraphintegert; endarg: igraphintegert;
                                  to: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_move_interval".}
proc igraphvectorintmoveinterval2*(v: ptr igraphvectorintt;
                                   begin: igraphintegert;
                                   endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_move_interval2".}
proc igraphvectorintfiltersmaller*(v: ptr igraphvectorintt; elem: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_filter_smaller".}
proc igraphvectorintgetinterval*(v: ptr igraphvectorintt;
                                 res: ptr igraphvectorintt;
                                 fromarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_get_interval".}
proc igraphvectorintdifferencesorted*(v1: ptr igraphvectorintt;
                                      v2: ptr igraphvectorintt;
                                      result: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_difference_sorted".}
proc igraphvectorintintersectsorted*(v1: ptr igraphvectorintt;
                                     v2: ptr igraphvectorintt;
                                     result: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_intersect_sorted".}
proc igraphvectorintindex*(v: ptr igraphvectorintt; newv: ptr igraphvectorintt;
                           idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_int_index".}
proc igraphvectorintindexint*(v: ptr igraphvectorintt; idx: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_index_int".}
proc igraphvectorcomplexinit*(v: ptr igraphvectorcomplext; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_init".}
proc igraphvectorcomplexinitarray*(v: ptr igraphvectorcomplext;
                                   data: ptr igraphcomplext;
                                   length: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_init_array".}
proc igraphvectorcomplexinitcopy*(to: ptr igraphvectorcomplext;
                                  fromarg: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_init_copy".}
proc igraphvectorcomplexcopy*(to: ptr igraphvectorcomplext;
                              fromarg: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_copy".}
proc igraphvectorcomplexdestroy*(v: ptr igraphvectorcomplext): void {.cdecl,
    importc: "igraph_vector_complex_destroy".}
proc igraphvectorcomplexcapacity*(v: ptr igraphvectorcomplext): igraphintegert {.
    cdecl, importc: "igraph_vector_complex_capacity".}
proc igraphvectorcomplexe*(v: ptr igraphvectorcomplext; pos: igraphintegert): igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_e".}
proc igraphvectorcomplexeptr*(v: ptr igraphvectorcomplext; pos: igraphintegert): ptr igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_e_ptr".}
proc igraphvectorcomplexget*(v: ptr igraphvectorcomplext; pos: igraphintegert): igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_get".}
proc igraphvectorcomplexgetptr*(v: ptr igraphvectorcomplext; pos: igraphintegert): ptr igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_get_ptr".}
proc igraphvectorcomplexset*(v: ptr igraphvectorcomplext; pos: igraphintegert;
                             value: igraphcomplext): void {.cdecl,
    importc: "igraph_vector_complex_set".}
proc igraphvectorcomplextail*(v: ptr igraphvectorcomplext): igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_tail".}
proc igraphvectorcomplexnull*(v: ptr igraphvectorcomplext): void {.cdecl,
    importc: "igraph_vector_complex_null".}
proc igraphvectorcomplexfill*(v: ptr igraphvectorcomplext; e: igraphcomplext): void {.
    cdecl, importc: "igraph_vector_complex_fill".}
proc igraphvectorcomplexview*(v: ptr igraphvectorcomplext;
                              data: ptr igraphcomplext; length: igraphintegert): ptr igraphvectorcomplext {.
    cdecl, importc: "igraph_vector_complex_view".}
proc igraphvectorcomplexcopyto*(v: ptr igraphvectorcomplext;
                                to: ptr igraphcomplext): void {.cdecl,
    importc: "igraph_vector_complex_copy_to".}
proc igraphvectorcomplexupdate*(to: ptr igraphvectorcomplext;
                                fromarg: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_update".}
proc igraphvectorcomplexappend*(to: ptr igraphvectorcomplext;
                                fromarg: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_append".}
proc igraphvectorcomplexswap*(v1: ptr igraphvectorcomplext;
                              v2: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_swap".}
proc igraphvectorcomplexswapelements*(v: ptr igraphvectorcomplext;
                                      i: igraphintegert; j: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_swap_elements".}
proc igraphvectorcomplexreverse*(v: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_reverse".}
proc igraphvectorcomplexpermute*(v: ptr igraphvectorcomplext;
                                 ind: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_permute".}
proc igraphvectorcomplexshuffle*(v: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_shuffle".}
proc igraphvectorcomplexaddconstant*(v: ptr igraphvectorcomplext;
                                     plus: igraphcomplext): void {.cdecl,
    importc: "igraph_vector_complex_add_constant".}
proc igraphvectorcomplexscale*(v: ptr igraphvectorcomplext; by: igraphcomplext): void {.
    cdecl, importc: "igraph_vector_complex_scale".}
proc igraphvectorcomplexadd*(v1: ptr igraphvectorcomplext;
                             v2: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_add".}
proc igraphvectorcomplexsub*(v1: ptr igraphvectorcomplext;
                             v2: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_sub".}
proc igraphvectorcomplexmul*(v1: ptr igraphvectorcomplext;
                             v2: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_mul".}
proc igraphvectorcomplexdiv*(v1: ptr igraphvectorcomplext;
                             v2: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_div".}
proc igraphvectorcomplexcumsum*(to: ptr igraphvectorcomplext;
                                fromarg: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_cumsum".}
proc igraphvectorcomplexalle*(lhs: ptr igraphvectorcomplext;
                              rhs: ptr igraphvectorcomplext): igraphboolt {.
    cdecl, importc: "igraph_vector_complex_all_e".}
proc igraphvectorcomplexempty*(v: ptr igraphvectorcomplext): igraphboolt {.
    cdecl, importc: "igraph_vector_complex_empty".}
proc igraphvectorcomplexsize*(v: ptr igraphvectorcomplext): igraphintegert {.
    cdecl, importc: "igraph_vector_complex_size".}
proc igraphvectorcomplexisnull*(v: ptr igraphvectorcomplext): igraphboolt {.
    cdecl, importc: "igraph_vector_complex_isnull".}
proc igraphvectorcomplexsum*(v: ptr igraphvectorcomplext): igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_sum".}
proc igraphvectorcomplexsumsq*(v: ptr igraphvectorcomplext): igraphrealt {.
    cdecl, importc: "igraph_vector_complex_sumsq".}
proc igraphvectorcomplexprod*(v: ptr igraphvectorcomplext): igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_prod".}
proc igraphvectorcomplexisequal*(lhs: ptr igraphvectorcomplext;
                                 rhs: ptr igraphvectorcomplext): igraphboolt {.
    cdecl, importc: "igraph_vector_complex_is_equal".}
proc igraphvectorcomplexcontains*(v: ptr igraphvectorcomplext; e: igraphcomplext): igraphboolt {.
    cdecl, importc: "igraph_vector_complex_contains".}
proc igraphvectorcomplexsearch*(v: ptr igraphvectorcomplext;
                                fromarg: igraphintegert; what: igraphcomplext;
                                pos: ptr igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_vector_complex_search".}
proc igraphvectorcomplexclear*(v: ptr igraphvectorcomplext): void {.cdecl,
    importc: "igraph_vector_complex_clear".}
proc igraphvectorcomplexresize*(v: ptr igraphvectorcomplext;
                                newsize: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_complex_resize".}
proc igraphvectorcomplexresizemin*(v: ptr igraphvectorcomplext): void {.cdecl,
    importc: "igraph_vector_complex_resize_min".}
proc igraphvectorcomplexreserve*(v: ptr igraphvectorcomplext;
                                 capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_reserve".}
proc igraphvectorcomplexpushback*(v: ptr igraphvectorcomplext; e: igraphcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_push_back".}
proc igraphvectorcomplexpopback*(v: ptr igraphvectorcomplext): igraphcomplext {.
    cdecl, importc: "igraph_vector_complex_pop_back".}
proc igraphvectorcomplexinsert*(v: ptr igraphvectorcomplext;
                                pos: igraphintegert; value: igraphcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_insert".}
proc igraphvectorcomplexremove*(v: ptr igraphvectorcomplext;
                                elem: igraphintegert): void {.cdecl,
    importc: "igraph_vector_complex_remove".}
proc igraphvectorcomplexremovefast*(v: ptr igraphvectorcomplext;
                                    elem: igraphintegert): void {.cdecl,
    importc: "igraph_vector_complex_remove_fast".}
proc igraphvectorcomplexremovesection*(v: ptr igraphvectorcomplext;
                                       fromarg: igraphintegert;
                                       to: igraphintegert): void {.cdecl,
    importc: "igraph_vector_complex_remove_section".}
proc igraphvectorcomplexprint*(v: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_print".}
proc igraphvectorcomplexfprint*(v: ptr igraphvectorcomplext; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_fprint".}
proc igraphvectorcomplexreal*(v: ptr igraphvectorcomplext;
                              real: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_complex_real".}
proc igraphvectorcompleximag*(v: ptr igraphvectorcomplext;
                              imag: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_complex_imag".}
proc igraphvectorcomplexrealimag*(v: ptr igraphvectorcomplext;
                                  real: ptr igraphvectort;
                                  imag: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_realimag".}
proc igraphvectorcomplexcreate*(v: ptr igraphvectorcomplext;
                                real: ptr igraphvectort; imag: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_create".}
proc igraphvectorcomplexcreatepolar*(v: ptr igraphvectorcomplext;
                                     r: ptr igraphvectort;
                                     theta: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_create_polar".}
proc igraphvectorcomplexallalmoste*(lhs: ptr igraphvectorcomplext;
                                    rhs: ptr igraphvectorcomplext;
                                    eps: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_vector_complex_all_almost_e".}
proc igraphvectorcomplexinitreal*(v: ptr igraphvectorcomplext; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_complex_init_real".}
proc igraphvectorcomplexinitint*(v: ptr igraphvectorcomplext; no: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_complex_init_int".}
proc igraphvectorcomplexinitrealend*(v: ptr igraphvectorcomplext;
                                     endmark: cdouble): igrapherrort {.cdecl,
    varargs, importc: "igraph_vector_complex_init_real_end".}
proc igraphvectorcomplexinitintend*(v: ptr igraphvectorcomplext; endmark: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_vector_complex_init_int_end".}
proc igraphvectorcomplexmoveinterval*(v: ptr igraphvectorcomplext;
                                      begin: igraphintegert;
                                      endarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_move_interval".}
proc igraphvectorcomplexmoveinterval2*(v: ptr igraphvectorcomplext;
                                       begin: igraphintegert;
                                       endarg: igraphintegert;
                                       to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_move_interval2".}
proc igraphvectorcomplexgetinterval*(v: ptr igraphvectorcomplext;
                                     res: ptr igraphvectorcomplext;
                                     fromarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_get_interval".}
proc igraphvectorcomplexindex*(v: ptr igraphvectorcomplext;
                               newv: ptr igraphvectorcomplext;
                               idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_complex_index".}
proc igraphvectorcomplexindexint*(v: ptr igraphvectorcomplext;
                                  idx: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_index_int".}
proc igraphvectorfloor*(fromarg: ptr igraphvectort; to: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_floor".}
proc igraphvectorround*(fromarg: ptr igraphvectort; to: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_round".}
proc igraphvectoretol*(lhs: ptr igraphvectort; rhs: ptr igraphvectort;
                       tol: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_vector_e_tol".}
proc igraphvectorallalmoste*(lhs: ptr igraphvectort; rhs: ptr igraphvectort;
                             eps: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_vector_all_almost_e".}
proc igraphvectorzapsmall*(v: ptr igraphvectort; tol: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_vector_zapsmall".}
proc igraphvectorcomplexzapsmall*(v: ptr igraphvectorcomplext; tol: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_vector_complex_zapsmall".}
proc igraphvectorisnan*(v: ptr igraphvectort; isnan: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_vector_is_nan".}
proc igraphvectorisanynan*(v: ptr igraphvectort): igraphboolt {.cdecl,
    importc: "igraph_vector_is_any_nan".}
proc igraphvectororder2*(v: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_order2".}
proc igraphvectorrank*(v: ptr igraphvectort; res: ptr igraphvectorintt;
                       nodes: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_rank".}
proc igraphvectorintpairorder*(v: ptr igraphvectorintt;
                               v2: ptr igraphvectorintt;
                               res: ptr igraphvectorintt; maxval: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_pair_order".}
proc igraphvectorintorder1*(v: ptr igraphvectorintt; res: ptr igraphvectorintt;
                            maxval: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_order1".}
proc igraphvectorintrank*(v: ptr igraphvectorintt; res: ptr igraphvectorintt;
                          nodes: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_rank".}
proc igraphrnginit*(rng: ptr igraphrngt; typearg: ptr igraphrngtypet): igrapherrort {.
    cdecl, importc: "igraph_rng_init".}
proc igraphrngdestroy*(rng: ptr igraphrngt): void {.cdecl,
    importc: "igraph_rng_destroy".}
proc igraphrngseed*(rng: ptr igraphrngt; seed: igraphuintt): igrapherrort {.
    cdecl, importc: "igraph_rng_seed".}
proc igraphrngbits*(rng: ptr igraphrngt): igraphintegert {.cdecl,
    importc: "igraph_rng_bits".}
proc igraphrngmax*(rng: ptr igraphrngt): igraphuintt {.cdecl,
    importc: "igraph_rng_max".}
proc igraphrngname*(rng: ptr igraphrngt): cstring {.cdecl,
    importc: "igraph_rng_name".}
proc igraphrnggetinteger*(rng: ptr igraphrngt; l: igraphintegert;
                          h: igraphintegert): igraphintegert {.cdecl,
    importc: "igraph_rng_get_integer".}
proc igraphrnggetnormal*(rng: ptr igraphrngt; m: igraphrealt; s: igraphrealt): igraphrealt {.
    cdecl, importc: "igraph_rng_get_normal".}
proc igraphrnggetunif*(rng: ptr igraphrngt; l: igraphrealt; h: igraphrealt): igraphrealt {.
    cdecl, importc: "igraph_rng_get_unif".}
proc igraphrnggetunif01*(rng: ptr igraphrngt): igraphrealt {.cdecl,
    importc: "igraph_rng_get_unif01".}
proc igraphrnggetgeom*(rng: ptr igraphrngt; p: igraphrealt): igraphrealt {.
    cdecl, importc: "igraph_rng_get_geom".}
proc igraphrnggetbinom*(rng: ptr igraphrngt; n: igraphintegert; p: igraphrealt): igraphrealt {.
    cdecl, importc: "igraph_rng_get_binom".}
proc igraphrnggetexp*(rng: ptr igraphrngt; rate: igraphrealt): igraphrealt {.
    cdecl, importc: "igraph_rng_get_exp".}
proc igraphrnggetgamma*(rng: ptr igraphrngt; shape: igraphrealt;
                        scale: igraphrealt): igraphrealt {.cdecl,
    importc: "igraph_rng_get_gamma".}
proc igraphrnggetpois*(rng: ptr igraphrngt; rate: igraphrealt): igraphrealt {.
    cdecl, importc: "igraph_rng_get_pois".}
proc igraphrnggetdirichlet*(rng: ptr igraphrngt; alpha: ptr igraphvectort;
                            result: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_rng_get_dirichlet".}
var igraphrngtypeglibc2* {.importc: "igraph_rngtype_glibc2".}: igraphrngtypet
var igraphrngtypemt19937* {.importc: "igraph_rngtype_mt19937".}: igraphrngtypet
var igraphrngtypepcg32* {.importc: "igraph_rngtype_pcg32".}: igraphrngtypet
var igraphrngtypepcg64* {.importc: "igraph_rngtype_pcg64".}: igraphrngtypet
proc igraphrngdefault*(): ptr igraphrngt {.cdecl, importc: "igraph_rng_default".}
proc igraphrngsetdefault*(rng: ptr igraphrngt): void {.cdecl,
    importc: "igraph_rng_set_default".}
proc igraphprogresshandlerstderr*(a0: cstring; a1: igraphrealt; a2: pointer): igrapherrort {.
    cdecl, importc: "igraph_progress_handler_stderr".}
proc igraphsetprogresshandler*(newhandler: igraphprogresshandlert): igraphprogresshandlert {.
    cdecl, importc: "igraph_set_progress_handler".}
proc igraphprogress*(message: cstring; percent: igraphrealt; data: pointer): igrapherrort {.
    cdecl, importc: "igraph_progress".}
proc igraphprogressf*(message: cstring; percent: igraphrealt; data: pointer): igrapherrort {.
    cdecl, varargs, importc: "igraph_progressf".}
proc igraphstatushandlerstderr*(a0: cstring; a1: pointer): igrapherrort {.cdecl,
    importc: "igraph_status_handler_stderr".}
proc igraphsetstatushandler*(newhandler: igraphstatushandlert): igraphstatushandlert {.
    cdecl, importc: "igraph_set_status_handler".}
proc igraphstatus*(message: cstring; data: pointer): igrapherrort {.cdecl,
    importc: "igraph_status".}
proc igraphstatusf*(message: cstring; data: pointer): igrapherrort {.cdecl,
    varargs, importc: "igraph_statusf".}
proc igraphmatrixinit*(m: ptr igraphmatrixt; nrow: igraphintegert;
                       ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_init".}
proc igraphmatrixinitarray*(m: ptr igraphmatrixt; data: ptr igraphrealt;
                            nrow: igraphintegert; ncol: igraphintegert;
                            storage: igraphmatrixstoraget): igrapherrort {.
    cdecl, importc: "igraph_matrix_init_array".}
proc igraphmatrixinitcopy*(to: ptr igraphmatrixt; fromarg: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_init_copy".}
proc igraphmatrixdestroy*(m: ptr igraphmatrixt): void {.cdecl,
    importc: "igraph_matrix_destroy".}
proc igraphmatrixcapacity*(m: ptr igraphmatrixt): igraphintegert {.cdecl,
    importc: "igraph_matrix_capacity".}
proc igraphmatrixcopy*(to: ptr igraphmatrixt; fromarg: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_copy".}
proc igraphmatrixe*(m: ptr igraphmatrixt; row: igraphintegert;
                    col: igraphintegert): igraphrealt {.cdecl,
    importc: "igraph_matrix_e".}
proc igraphmatrixeptr*(m: ptr igraphmatrixt; row: igraphintegert;
                       col: igraphintegert): ptr igraphrealt {.cdecl,
    importc: "igraph_matrix_e_ptr".}
proc igraphmatrixget*(m: ptr igraphmatrixt; row: igraphintegert;
                      col: igraphintegert): igraphrealt {.cdecl,
    importc: "igraph_matrix_get".}
proc igraphmatrixgetptr*(m: ptr igraphmatrixt; row: igraphintegert;
                         col: igraphintegert): ptr igraphrealt {.cdecl,
    importc: "igraph_matrix_get_ptr".}
proc igraphmatrixset*(m: ptr igraphmatrixt; row: igraphintegert;
                      col: igraphintegert; value: igraphrealt): void {.cdecl,
    importc: "igraph_matrix_set".}
proc igraphmatrixnull*(m: ptr igraphmatrixt): void {.cdecl,
    importc: "igraph_matrix_null".}
proc igraphmatrixfill*(m: ptr igraphmatrixt; e: igraphrealt): void {.cdecl,
    importc: "igraph_matrix_fill".}
proc igraphmatrixview*(m: ptr igraphmatrixt; data: ptr igraphrealt;
                       nrow: igraphintegert; ncol: igraphintegert): ptr igraphmatrixt {.
    cdecl, importc: "igraph_matrix_view".}
proc igraphmatrixviewfromvector*(m: ptr igraphmatrixt; v: ptr igraphvectort;
                                 ncol: igraphintegert): ptr igraphmatrixt {.
    cdecl, importc: "igraph_matrix_view_from_vector".}
proc igraphmatrixcopyto*(m: ptr igraphmatrixt; to: ptr igraphrealt): void {.
    cdecl, importc: "igraph_matrix_copy_to".}
proc igraphmatrixupdate*(to: ptr igraphmatrixt; fromarg: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_update".}
proc igraphmatrixrbind*(to: ptr igraphmatrixt; fromarg: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_rbind".}
proc igraphmatrixcbind*(to: ptr igraphmatrixt; fromarg: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_cbind".}
proc igraphmatrixswap*(m1: ptr igraphmatrixt; m2: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_swap".}
proc igraphmatrixgetrow*(m: ptr igraphmatrixt; res: ptr igraphvectort;
                         index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_get_row".}
proc igraphmatrixgetcol*(m: ptr igraphmatrixt; res: ptr igraphvectort;
                         index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_get_col".}
proc igraphmatrixsetrow*(m: ptr igraphmatrixt; v: ptr igraphvectort;
                         index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_set_row".}
proc igraphmatrixsetcol*(m: ptr igraphmatrixt; v: ptr igraphvectort;
                         index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_set_col".}
proc igraphmatrixselectrows*(m: ptr igraphmatrixt; res: ptr igraphmatrixt;
                             rows: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_matrix_select_rows".}
proc igraphmatrixselectcols*(m: ptr igraphmatrixt; res: ptr igraphmatrixt;
                             cols: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_matrix_select_cols".}
proc igraphmatrixselectrowscols*(m: ptr igraphmatrixt; res: ptr igraphmatrixt;
                                 rows: ptr igraphvectorintt;
                                 cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_select_rows_cols".}
proc igraphmatrixswaprows*(m: ptr igraphmatrixt; i: igraphintegert;
                           j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_swap_rows".}
proc igraphmatrixswapcols*(m: ptr igraphmatrixt; i: igraphintegert;
                           j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_swap_cols".}
proc igraphmatrixswaprowcol*(m: ptr igraphmatrixt; i: igraphintegert;
                             j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_swap_rowcol".}
proc igraphmatrixtranspose*(m: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_transpose".}
proc igraphmatrixadd*(m1: ptr igraphmatrixt; m2: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_add".}
proc igraphmatrixsub*(m1: ptr igraphmatrixt; m2: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_sub".}
proc igraphmatrixmulelements*(m1: ptr igraphmatrixt; m2: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_mul_elements".}
proc igraphmatrixdivelements*(m1: ptr igraphmatrixt; m2: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_div_elements".}
proc igraphmatrixscale*(m: ptr igraphmatrixt; by: igraphrealt): void {.cdecl,
    importc: "igraph_matrix_scale".}
proc igraphmatrixaddconstant*(m: ptr igraphmatrixt; plus: igraphrealt): void {.
    cdecl, importc: "igraph_matrix_add_constant".}
proc igraphmatrixmin*(m: ptr igraphmatrixt): igraphrealt {.cdecl,
    importc: "igraph_matrix_min".}
proc igraphmatrixmax*(m: ptr igraphmatrixt): igraphrealt {.cdecl,
    importc: "igraph_matrix_max".}
proc igraphmatrixwhichmin*(m: ptr igraphmatrixt; i: ptr igraphintegert;
                           j: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_which_min".}
proc igraphmatrixwhichmax*(m: ptr igraphmatrixt; i: ptr igraphintegert;
                           j: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_which_max".}
proc igraphmatrixminmax*(m: ptr igraphmatrixt; min: ptr igraphrealt;
                         max: ptr igraphrealt): void {.cdecl,
    importc: "igraph_matrix_minmax".}
proc igraphmatrixwhichminmax*(m: ptr igraphmatrixt; imin: ptr igraphintegert;
                              jmin: ptr igraphintegert;
                              imax: ptr igraphintegert; jmax: ptr igraphintegert): void {.
    cdecl, importc: "igraph_matrix_which_minmax".}
proc igraphmatrixalle*(lhs: ptr igraphmatrixt; rhs: ptr igraphmatrixt): igraphboolt {.
    cdecl, importc: "igraph_matrix_all_e".}
proc igraphmatrixalll*(lhs: ptr igraphmatrixt; rhs: ptr igraphmatrixt): igraphboolt {.
    cdecl, importc: "igraph_matrix_all_l".}
proc igraphmatrixallg*(lhs: ptr igraphmatrixt; rhs: ptr igraphmatrixt): igraphboolt {.
    cdecl, importc: "igraph_matrix_all_g".}
proc igraphmatrixallle*(lhs: ptr igraphmatrixt; rhs: ptr igraphmatrixt): igraphboolt {.
    cdecl, importc: "igraph_matrix_all_le".}
proc igraphmatrixallge*(lhs: ptr igraphmatrixt; rhs: ptr igraphmatrixt): igraphboolt {.
    cdecl, importc: "igraph_matrix_all_ge".}
proc igraphmatrixisnull*(m: ptr igraphmatrixt): igraphboolt {.cdecl,
    importc: "igraph_matrix_isnull".}
proc igraphmatrixempty*(m: ptr igraphmatrixt): igraphboolt {.cdecl,
    importc: "igraph_matrix_empty".}
proc igraphmatrixsize*(m: ptr igraphmatrixt): igraphintegert {.cdecl,
    importc: "igraph_matrix_size".}
proc igraphmatrixnrow*(m: ptr igraphmatrixt): igraphintegert {.cdecl,
    importc: "igraph_matrix_nrow".}
proc igraphmatrixncol*(m: ptr igraphmatrixt): igraphintegert {.cdecl,
    importc: "igraph_matrix_ncol".}
proc igraphmatrixissymmetric*(m: ptr igraphmatrixt): igraphboolt {.cdecl,
    importc: "igraph_matrix_is_symmetric".}
proc igraphmatrixsum*(m: ptr igraphmatrixt): igraphrealt {.cdecl,
    importc: "igraph_matrix_sum".}
proc igraphmatrixprod*(m: ptr igraphmatrixt): igraphrealt {.cdecl,
    importc: "igraph_matrix_prod".}
proc igraphmatrixrowsum*(m: ptr igraphmatrixt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_matrix_rowsum".}
proc igraphmatrixcolsum*(m: ptr igraphmatrixt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_matrix_colsum".}
proc igraphmatrixisequal*(m1: ptr igraphmatrixt; m2: ptr igraphmatrixt): igraphboolt {.
    cdecl, importc: "igraph_matrix_is_equal".}
proc igraphmatrixmaxdifference*(m1: ptr igraphmatrixt; m2: ptr igraphmatrixt): igraphrealt {.
    cdecl, importc: "igraph_matrix_maxdifference".}
proc igraphmatrixcontains*(m: ptr igraphmatrixt; e: igraphrealt): igraphboolt {.
    cdecl, importc: "igraph_matrix_contains".}
proc igraphmatrixsearch*(m: ptr igraphmatrixt; fromarg: igraphintegert;
                         what: igraphrealt; pos: ptr igraphintegert;
                         row: ptr igraphintegert; col: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_matrix_search".}
proc igraphmatrixresize*(m: ptr igraphmatrixt; nrow: igraphintegert;
                         ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_resize".}
proc igraphmatrixresizemin*(m: ptr igraphmatrixt): void {.cdecl,
    importc: "igraph_matrix_resize_min".}
proc igraphmatrixaddcols*(m: ptr igraphmatrixt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_add_cols".}
proc igraphmatrixaddrows*(m: ptr igraphmatrixt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_add_rows".}
proc igraphmatrixremovecol*(m: ptr igraphmatrixt; col: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_remove_col".}
proc igraphmatrixremoverow*(m: ptr igraphmatrixt; row: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_remove_row".}
proc igraphmatrixprint*(m: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_print".}
proc igraphmatrixfprint*(m: ptr igraphmatrixt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_matrix_fprint".}
proc igraphmatrixprintf*(m: ptr igraphmatrixt; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_matrix_printf".}
proc igraphmatrixpermdeleterows*(m: ptr igraphmatrixt;
                                 index: ptr igraphintegert;
                                 nremove: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_permdelete_rows".}
proc igraphmatrixintinit*(m: ptr igraphmatrixintt; nrow: igraphintegert;
                          ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_init".}
proc igraphmatrixintinitarray*(m: ptr igraphmatrixintt;
                               data: ptr igraphintegert; nrow: igraphintegert;
                               ncol: igraphintegert;
                               storage: igraphmatrixstoraget): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_init_array".}
proc igraphmatrixintinitcopy*(to: ptr igraphmatrixintt;
                              fromarg: ptr igraphmatrixintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_init_copy".}
proc igraphmatrixintdestroy*(m: ptr igraphmatrixintt): void {.cdecl,
    importc: "igraph_matrix_int_destroy".}
proc igraphmatrixintcapacity*(m: ptr igraphmatrixintt): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_capacity".}
proc igraphmatrixintcopy*(to: ptr igraphmatrixintt;
                          fromarg: ptr igraphmatrixintt): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_copy".}
proc igraphmatrixinte*(m: ptr igraphmatrixintt; row: igraphintegert;
                       col: igraphintegert): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_e".}
proc igraphmatrixinteptr*(m: ptr igraphmatrixintt; row: igraphintegert;
                          col: igraphintegert): ptr igraphintegert {.cdecl,
    importc: "igraph_matrix_int_e_ptr".}
proc igraphmatrixintget*(m: ptr igraphmatrixintt; row: igraphintegert;
                         col: igraphintegert): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_get".}
proc igraphmatrixintgetptr*(m: ptr igraphmatrixintt; row: igraphintegert;
                            col: igraphintegert): ptr igraphintegert {.cdecl,
    importc: "igraph_matrix_int_get_ptr".}
proc igraphmatrixintset*(m: ptr igraphmatrixintt; row: igraphintegert;
                         col: igraphintegert; value: igraphintegert): void {.
    cdecl, importc: "igraph_matrix_int_set".}
proc igraphmatrixintnull*(m: ptr igraphmatrixintt): void {.cdecl,
    importc: "igraph_matrix_int_null".}
proc igraphmatrixintfill*(m: ptr igraphmatrixintt; e: igraphintegert): void {.
    cdecl, importc: "igraph_matrix_int_fill".}
proc igraphmatrixintview*(m: ptr igraphmatrixintt; data: ptr igraphintegert;
                          nrow: igraphintegert; ncol: igraphintegert): ptr igraphmatrixintt {.
    cdecl, importc: "igraph_matrix_int_view".}
proc igraphmatrixintviewfromvector*(m: ptr igraphmatrixintt;
                                    v: ptr igraphvectorintt;
                                    ncol: igraphintegert): ptr igraphmatrixintt {.
    cdecl, importc: "igraph_matrix_int_view_from_vector".}
proc igraphmatrixintcopyto*(m: ptr igraphmatrixintt; to: ptr igraphintegert): void {.
    cdecl, importc: "igraph_matrix_int_copy_to".}
proc igraphmatrixintupdate*(to: ptr igraphmatrixintt;
                            fromarg: ptr igraphmatrixintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_update".}
proc igraphmatrixintrbind*(to: ptr igraphmatrixintt;
                           fromarg: ptr igraphmatrixintt): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_rbind".}
proc igraphmatrixintcbind*(to: ptr igraphmatrixintt;
                           fromarg: ptr igraphmatrixintt): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_cbind".}
proc igraphmatrixintswap*(m1: ptr igraphmatrixintt; m2: ptr igraphmatrixintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_swap".}
proc igraphmatrixintgetrow*(m: ptr igraphmatrixintt; res: ptr igraphvectorintt;
                            index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_get_row".}
proc igraphmatrixintgetcol*(m: ptr igraphmatrixintt; res: ptr igraphvectorintt;
                            index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_get_col".}
proc igraphmatrixintsetrow*(m: ptr igraphmatrixintt; v: ptr igraphvectorintt;
                            index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_set_row".}
proc igraphmatrixintsetcol*(m: ptr igraphmatrixintt; v: ptr igraphvectorintt;
                            index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_set_col".}
proc igraphmatrixintselectrows*(m: ptr igraphmatrixintt;
                                res: ptr igraphmatrixintt;
                                rows: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_select_rows".}
proc igraphmatrixintselectcols*(m: ptr igraphmatrixintt;
                                res: ptr igraphmatrixintt;
                                cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_select_cols".}
proc igraphmatrixintselectrowscols*(m: ptr igraphmatrixintt;
                                    res: ptr igraphmatrixintt;
                                    rows: ptr igraphvectorintt;
                                    cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_select_rows_cols".}
proc igraphmatrixintswaprows*(m: ptr igraphmatrixintt; i: igraphintegert;
                              j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_swap_rows".}
proc igraphmatrixintswapcols*(m: ptr igraphmatrixintt; i: igraphintegert;
                              j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_swap_cols".}
proc igraphmatrixintswaprowcol*(m: ptr igraphmatrixintt; i: igraphintegert;
                                j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_swap_rowcol".}
proc igraphmatrixinttranspose*(m: ptr igraphmatrixintt): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_transpose".}
proc igraphmatrixintadd*(m1: ptr igraphmatrixintt; m2: ptr igraphmatrixintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_add".}
proc igraphmatrixintsub*(m1: ptr igraphmatrixintt; m2: ptr igraphmatrixintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_sub".}
proc igraphmatrixintmulelements*(m1: ptr igraphmatrixintt;
                                 m2: ptr igraphmatrixintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_mul_elements".}
proc igraphmatrixintdivelements*(m1: ptr igraphmatrixintt;
                                 m2: ptr igraphmatrixintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_div_elements".}
proc igraphmatrixintscale*(m: ptr igraphmatrixintt; by: igraphintegert): void {.
    cdecl, importc: "igraph_matrix_int_scale".}
proc igraphmatrixintaddconstant*(m: ptr igraphmatrixintt; plus: igraphintegert): void {.
    cdecl, importc: "igraph_matrix_int_add_constant".}
proc igraphmatrixintmin*(m: ptr igraphmatrixintt): igraphrealt {.cdecl,
    importc: "igraph_matrix_int_min".}
proc igraphmatrixintmax*(m: ptr igraphmatrixintt): igraphrealt {.cdecl,
    importc: "igraph_matrix_int_max".}
proc igraphmatrixintwhichmin*(m: ptr igraphmatrixintt; i: ptr igraphintegert;
                              j: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_int_which_min".}
proc igraphmatrixintwhichmax*(m: ptr igraphmatrixintt; i: ptr igraphintegert;
                              j: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_int_which_max".}
proc igraphmatrixintminmax*(m: ptr igraphmatrixintt; min: ptr igraphintegert;
                            max: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_int_minmax".}
proc igraphmatrixintwhichminmax*(m: ptr igraphmatrixintt;
                                 imin: ptr igraphintegert;
                                 jmin: ptr igraphintegert;
                                 imax: ptr igraphintegert;
                                 jmax: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_int_which_minmax".}
proc igraphmatrixintalle*(lhs: ptr igraphmatrixintt; rhs: ptr igraphmatrixintt): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_all_e".}
proc igraphmatrixintalll*(lhs: ptr igraphmatrixintt; rhs: ptr igraphmatrixintt): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_all_l".}
proc igraphmatrixintallg*(lhs: ptr igraphmatrixintt; rhs: ptr igraphmatrixintt): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_all_g".}
proc igraphmatrixintallle*(lhs: ptr igraphmatrixintt; rhs: ptr igraphmatrixintt): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_all_le".}
proc igraphmatrixintallge*(lhs: ptr igraphmatrixintt; rhs: ptr igraphmatrixintt): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_all_ge".}
proc igraphmatrixintisnull*(m: ptr igraphmatrixintt): igraphboolt {.cdecl,
    importc: "igraph_matrix_int_isnull".}
proc igraphmatrixintempty*(m: ptr igraphmatrixintt): igraphboolt {.cdecl,
    importc: "igraph_matrix_int_empty".}
proc igraphmatrixintsize*(m: ptr igraphmatrixintt): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_size".}
proc igraphmatrixintnrow*(m: ptr igraphmatrixintt): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_nrow".}
proc igraphmatrixintncol*(m: ptr igraphmatrixintt): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_ncol".}
proc igraphmatrixintissymmetric*(m: ptr igraphmatrixintt): igraphboolt {.cdecl,
    importc: "igraph_matrix_int_is_symmetric".}
proc igraphmatrixintsum*(m: ptr igraphmatrixintt): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_sum".}
proc igraphmatrixintprod*(m: ptr igraphmatrixintt): igraphintegert {.cdecl,
    importc: "igraph_matrix_int_prod".}
proc igraphmatrixintrowsum*(m: ptr igraphmatrixintt; res: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_rowsum".}
proc igraphmatrixintcolsum*(m: ptr igraphmatrixintt; res: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_colsum".}
proc igraphmatrixintisequal*(m1: ptr igraphmatrixintt; m2: ptr igraphmatrixintt): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_is_equal".}
proc igraphmatrixintmaxdifference*(m1: ptr igraphmatrixintt;
                                   m2: ptr igraphmatrixintt): igraphrealt {.
    cdecl, importc: "igraph_matrix_int_maxdifference".}
proc igraphmatrixintcontains*(m: ptr igraphmatrixintt; e: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_contains".}
proc igraphmatrixintsearch*(m: ptr igraphmatrixintt; fromarg: igraphintegert;
                            what: igraphintegert; pos: ptr igraphintegert;
                            row: ptr igraphintegert; col: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_matrix_int_search".}
proc igraphmatrixintresize*(m: ptr igraphmatrixintt; nrow: igraphintegert;
                            ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_resize".}
proc igraphmatrixintresizemin*(m: ptr igraphmatrixintt): void {.cdecl,
    importc: "igraph_matrix_int_resize_min".}
proc igraphmatrixintaddcols*(m: ptr igraphmatrixintt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_add_cols".}
proc igraphmatrixintaddrows*(m: ptr igraphmatrixintt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_add_rows".}
proc igraphmatrixintremovecol*(m: ptr igraphmatrixintt; col: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_remove_col".}
proc igraphmatrixintremoverow*(m: ptr igraphmatrixintt; row: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_remove_row".}
proc igraphmatrixintprint*(m: ptr igraphmatrixintt): igrapherrort {.cdecl,
    importc: "igraph_matrix_int_print".}
proc igraphmatrixintfprint*(m: ptr igraphmatrixintt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_fprint".}
proc igraphmatrixintprintf*(m: ptr igraphmatrixintt; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_printf".}
proc igraphmatrixintpermdeleterows*(m: ptr igraphmatrixintt;
                                    index: ptr igraphintegert;
                                    nremove: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_int_permdelete_rows".}
proc igraphmatrixcharinit*(m: ptr igraphmatrixchart; nrow: igraphintegert;
                           ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_init".}
proc igraphmatrixcharinitarray*(m: ptr igraphmatrixchart; data: cstring;
                                nrow: igraphintegert; ncol: igraphintegert;
                                storage: igraphmatrixstoraget): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_init_array".}
proc igraphmatrixcharinitcopy*(to: ptr igraphmatrixchart;
                               fromarg: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_init_copy".}
proc igraphmatrixchardestroy*(m: ptr igraphmatrixchart): void {.cdecl,
    importc: "igraph_matrix_char_destroy".}
proc igraphmatrixcharcapacity*(m: ptr igraphmatrixchart): igraphintegert {.
    cdecl, importc: "igraph_matrix_char_capacity".}
proc igraphmatrixcharcopy*(to: ptr igraphmatrixchart;
                           fromarg: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_copy".}
proc igraphmatrixchare*(m: ptr igraphmatrixchart; row: igraphintegert;
                        col: igraphintegert): cschar {.cdecl,
    importc: "igraph_matrix_char_e".}
proc igraphmatrixchareptr*(m: ptr igraphmatrixchart; row: igraphintegert;
                           col: igraphintegert): cstring {.cdecl,
    importc: "igraph_matrix_char_e_ptr".}
proc igraphmatrixcharget*(m: ptr igraphmatrixchart; row: igraphintegert;
                          col: igraphintegert): cschar {.cdecl,
    importc: "igraph_matrix_char_get".}
proc igraphmatrixchargetptr*(m: ptr igraphmatrixchart; row: igraphintegert;
                             col: igraphintegert): cstring {.cdecl,
    importc: "igraph_matrix_char_get_ptr".}
proc igraphmatrixcharset*(m: ptr igraphmatrixchart; row: igraphintegert;
                          col: igraphintegert; value: cschar): void {.cdecl,
    importc: "igraph_matrix_char_set".}
proc igraphmatrixcharnull*(m: ptr igraphmatrixchart): void {.cdecl,
    importc: "igraph_matrix_char_null".}
proc igraphmatrixcharfill*(m: ptr igraphmatrixchart; e: cschar): void {.cdecl,
    importc: "igraph_matrix_char_fill".}
proc igraphmatrixcharview*(m: ptr igraphmatrixchart; data: cstring;
                           nrow: igraphintegert; ncol: igraphintegert): ptr igraphmatrixchart {.
    cdecl, importc: "igraph_matrix_char_view".}
proc igraphmatrixcharviewfromvector*(m: ptr igraphmatrixchart;
                                     v: ptr igraphvectorchart;
                                     ncol: igraphintegert): ptr igraphmatrixchart {.
    cdecl, importc: "igraph_matrix_char_view_from_vector".}
proc igraphmatrixcharcopyto*(m: ptr igraphmatrixchart; to: cstring): void {.
    cdecl, importc: "igraph_matrix_char_copy_to".}
proc igraphmatrixcharupdate*(to: ptr igraphmatrixchart;
                             fromarg: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_update".}
proc igraphmatrixcharrbind*(to: ptr igraphmatrixchart;
                            fromarg: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_rbind".}
proc igraphmatrixcharcbind*(to: ptr igraphmatrixchart;
                            fromarg: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_cbind".}
proc igraphmatrixcharswap*(m1: ptr igraphmatrixchart; m2: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_swap".}
proc igraphmatrixchargetrow*(m: ptr igraphmatrixchart;
                             res: ptr igraphvectorchart; index: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_get_row".}
proc igraphmatrixchargetcol*(m: ptr igraphmatrixchart;
                             res: ptr igraphvectorchart; index: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_get_col".}
proc igraphmatrixcharsetrow*(m: ptr igraphmatrixchart; v: ptr igraphvectorchart;
                             index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_set_row".}
proc igraphmatrixcharsetcol*(m: ptr igraphmatrixchart; v: ptr igraphvectorchart;
                             index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_set_col".}
proc igraphmatrixcharselectrows*(m: ptr igraphmatrixchart;
                                 res: ptr igraphmatrixchart;
                                 rows: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_select_rows".}
proc igraphmatrixcharselectcols*(m: ptr igraphmatrixchart;
                                 res: ptr igraphmatrixchart;
                                 cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_select_cols".}
proc igraphmatrixcharselectrowscols*(m: ptr igraphmatrixchart;
                                     res: ptr igraphmatrixchart;
                                     rows: ptr igraphvectorintt;
                                     cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_select_rows_cols".}
proc igraphmatrixcharswaprows*(m: ptr igraphmatrixchart; i: igraphintegert;
                               j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_swap_rows".}
proc igraphmatrixcharswapcols*(m: ptr igraphmatrixchart; i: igraphintegert;
                               j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_swap_cols".}
proc igraphmatrixcharswaprowcol*(m: ptr igraphmatrixchart; i: igraphintegert;
                                 j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_swap_rowcol".}
proc igraphmatrixchartranspose*(m: ptr igraphmatrixchart): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_transpose".}
proc igraphmatrixcharadd*(m1: ptr igraphmatrixchart; m2: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_add".}
proc igraphmatrixcharsub*(m1: ptr igraphmatrixchart; m2: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_sub".}
proc igraphmatrixcharmulelements*(m1: ptr igraphmatrixchart;
                                  m2: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_mul_elements".}
proc igraphmatrixchardivelements*(m1: ptr igraphmatrixchart;
                                  m2: ptr igraphmatrixchart): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_div_elements".}
proc igraphmatrixcharscale*(m: ptr igraphmatrixchart; by: cschar): void {.cdecl,
    importc: "igraph_matrix_char_scale".}
proc igraphmatrixcharaddconstant*(m: ptr igraphmatrixchart; plus: cschar): void {.
    cdecl, importc: "igraph_matrix_char_add_constant".}
proc igraphmatrixcharmin*(m: ptr igraphmatrixchart): igraphrealt {.cdecl,
    importc: "igraph_matrix_char_min".}
proc igraphmatrixcharmax*(m: ptr igraphmatrixchart): igraphrealt {.cdecl,
    importc: "igraph_matrix_char_max".}
proc igraphmatrixcharwhichmin*(m: ptr igraphmatrixchart; i: ptr igraphintegert;
                               j: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_char_which_min".}
proc igraphmatrixcharwhichmax*(m: ptr igraphmatrixchart; i: ptr igraphintegert;
                               j: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_char_which_max".}
proc igraphmatrixcharminmax*(m: ptr igraphmatrixchart; min: cstring;
                             max: cstring): void {.cdecl,
    importc: "igraph_matrix_char_minmax".}
proc igraphmatrixcharwhichminmax*(m: ptr igraphmatrixchart;
                                  imin: ptr igraphintegert;
                                  jmin: ptr igraphintegert;
                                  imax: ptr igraphintegert;
                                  jmax: ptr igraphintegert): void {.cdecl,
    importc: "igraph_matrix_char_which_minmax".}
proc igraphmatrixcharalle*(lhs: ptr igraphmatrixchart;
                           rhs: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_all_e".}
proc igraphmatrixcharalll*(lhs: ptr igraphmatrixchart;
                           rhs: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_all_l".}
proc igraphmatrixcharallg*(lhs: ptr igraphmatrixchart;
                           rhs: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_all_g".}
proc igraphmatrixcharallle*(lhs: ptr igraphmatrixchart;
                            rhs: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_all_le".}
proc igraphmatrixcharallge*(lhs: ptr igraphmatrixchart;
                            rhs: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_all_ge".}
proc igraphmatrixcharisnull*(m: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_isnull".}
proc igraphmatrixcharempty*(m: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_empty".}
proc igraphmatrixcharsize*(m: ptr igraphmatrixchart): igraphintegert {.cdecl,
    importc: "igraph_matrix_char_size".}
proc igraphmatrixcharnrow*(m: ptr igraphmatrixchart): igraphintegert {.cdecl,
    importc: "igraph_matrix_char_nrow".}
proc igraphmatrixcharncol*(m: ptr igraphmatrixchart): igraphintegert {.cdecl,
    importc: "igraph_matrix_char_ncol".}
proc igraphmatrixcharissymmetric*(m: ptr igraphmatrixchart): igraphboolt {.
    cdecl, importc: "igraph_matrix_char_is_symmetric".}
proc igraphmatrixcharsum*(m: ptr igraphmatrixchart): cschar {.cdecl,
    importc: "igraph_matrix_char_sum".}
proc igraphmatrixcharprod*(m: ptr igraphmatrixchart): cschar {.cdecl,
    importc: "igraph_matrix_char_prod".}
proc igraphmatrixcharrowsum*(m: ptr igraphmatrixchart;
                             res: ptr igraphvectorchart): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_rowsum".}
proc igraphmatrixcharcolsum*(m: ptr igraphmatrixchart;
                             res: ptr igraphvectorchart): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_colsum".}
proc igraphmatrixcharisequal*(m1: ptr igraphmatrixchart;
                              m2: ptr igraphmatrixchart): igraphboolt {.cdecl,
    importc: "igraph_matrix_char_is_equal".}
proc igraphmatrixcharmaxdifference*(m1: ptr igraphmatrixchart;
                                    m2: ptr igraphmatrixchart): igraphrealt {.
    cdecl, importc: "igraph_matrix_char_maxdifference".}
proc igraphmatrixcharcontains*(m: ptr igraphmatrixchart; e: cschar): igraphboolt {.
    cdecl, importc: "igraph_matrix_char_contains".}
proc igraphmatrixcharsearch*(m: ptr igraphmatrixchart; fromarg: igraphintegert;
                             what: cschar; pos: ptr igraphintegert;
                             row: ptr igraphintegert; col: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_matrix_char_search".}
proc igraphmatrixcharresize*(m: ptr igraphmatrixchart; nrow: igraphintegert;
                             ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_resize".}
proc igraphmatrixcharresizemin*(m: ptr igraphmatrixchart): void {.cdecl,
    importc: "igraph_matrix_char_resize_min".}
proc igraphmatrixcharaddcols*(m: ptr igraphmatrixchart; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_add_cols".}
proc igraphmatrixcharaddrows*(m: ptr igraphmatrixchart; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_add_rows".}
proc igraphmatrixcharremovecol*(m: ptr igraphmatrixchart; col: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_remove_col".}
proc igraphmatrixcharremoverow*(m: ptr igraphmatrixchart; row: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_remove_row".}
proc igraphmatrixcharprint*(m: ptr igraphmatrixchart): igrapherrort {.cdecl,
    importc: "igraph_matrix_char_print".}
proc igraphmatrixcharfprint*(m: ptr igraphmatrixchart; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_fprint".}
proc igraphmatrixcharprintf*(m: ptr igraphmatrixchart; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_printf".}
proc igraphmatrixcharpermdeleterows*(m: ptr igraphmatrixchart;
                                     index: ptr igraphintegert;
                                     nremove: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_char_permdelete_rows".}
proc igraphmatrixboolinit*(m: ptr igraphmatrixboolt; nrow: igraphintegert;
                           ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_init".}
proc igraphmatrixboolinitarray*(m: ptr igraphmatrixboolt; data: ptr igraphboolt;
                                nrow: igraphintegert; ncol: igraphintegert;
                                storage: igraphmatrixstoraget): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_init_array".}
proc igraphmatrixboolinitcopy*(to: ptr igraphmatrixboolt;
                               fromarg: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_init_copy".}
proc igraphmatrixbooldestroy*(m: ptr igraphmatrixboolt): void {.cdecl,
    importc: "igraph_matrix_bool_destroy".}
proc igraphmatrixboolcapacity*(m: ptr igraphmatrixboolt): igraphintegert {.
    cdecl, importc: "igraph_matrix_bool_capacity".}
proc igraphmatrixboolcopy*(to: ptr igraphmatrixboolt;
                           fromarg: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_copy".}
proc igraphmatrixboole*(m: ptr igraphmatrixboolt; row: igraphintegert;
                        col: igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_e".}
proc igraphmatrixbooleptr*(m: ptr igraphmatrixboolt; row: igraphintegert;
                           col: igraphintegert): ptr igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_e_ptr".}
proc igraphmatrixboolget*(m: ptr igraphmatrixboolt; row: igraphintegert;
                          col: igraphintegert): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_get".}
proc igraphmatrixboolgetptr*(m: ptr igraphmatrixboolt; row: igraphintegert;
                             col: igraphintegert): ptr igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_get_ptr".}
proc igraphmatrixboolset*(m: ptr igraphmatrixboolt; row: igraphintegert;
                          col: igraphintegert; value: igraphboolt): void {.
    cdecl, importc: "igraph_matrix_bool_set".}
proc igraphmatrixboolnull*(m: ptr igraphmatrixboolt): void {.cdecl,
    importc: "igraph_matrix_bool_null".}
proc igraphmatrixboolfill*(m: ptr igraphmatrixboolt; e: igraphboolt): void {.
    cdecl, importc: "igraph_matrix_bool_fill".}
proc igraphmatrixboolview*(m: ptr igraphmatrixboolt; data: ptr igraphboolt;
                           nrow: igraphintegert; ncol: igraphintegert): ptr igraphmatrixboolt {.
    cdecl, importc: "igraph_matrix_bool_view".}
proc igraphmatrixboolviewfromvector*(m: ptr igraphmatrixboolt;
                                     v: ptr igraphvectorboolt;
                                     ncol: igraphintegert): ptr igraphmatrixboolt {.
    cdecl, importc: "igraph_matrix_bool_view_from_vector".}
proc igraphmatrixboolcopyto*(m: ptr igraphmatrixboolt; to: ptr igraphboolt): void {.
    cdecl, importc: "igraph_matrix_bool_copy_to".}
proc igraphmatrixboolupdate*(to: ptr igraphmatrixboolt;
                             fromarg: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_update".}
proc igraphmatrixboolrbind*(to: ptr igraphmatrixboolt;
                            fromarg: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_rbind".}
proc igraphmatrixboolcbind*(to: ptr igraphmatrixboolt;
                            fromarg: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_cbind".}
proc igraphmatrixboolswap*(m1: ptr igraphmatrixboolt; m2: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_swap".}
proc igraphmatrixboolgetrow*(m: ptr igraphmatrixboolt;
                             res: ptr igraphvectorboolt; index: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_get_row".}
proc igraphmatrixboolgetcol*(m: ptr igraphmatrixboolt;
                             res: ptr igraphvectorboolt; index: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_get_col".}
proc igraphmatrixboolsetrow*(m: ptr igraphmatrixboolt; v: ptr igraphvectorboolt;
                             index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_set_row".}
proc igraphmatrixboolsetcol*(m: ptr igraphmatrixboolt; v: ptr igraphvectorboolt;
                             index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_set_col".}
proc igraphmatrixboolselectrows*(m: ptr igraphmatrixboolt;
                                 res: ptr igraphmatrixboolt;
                                 rows: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_select_rows".}
proc igraphmatrixboolselectcols*(m: ptr igraphmatrixboolt;
                                 res: ptr igraphmatrixboolt;
                                 cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_select_cols".}
proc igraphmatrixboolselectrowscols*(m: ptr igraphmatrixboolt;
                                     res: ptr igraphmatrixboolt;
                                     rows: ptr igraphvectorintt;
                                     cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_select_rows_cols".}
proc igraphmatrixboolswaprows*(m: ptr igraphmatrixboolt; i: igraphintegert;
                               j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_swap_rows".}
proc igraphmatrixboolswapcols*(m: ptr igraphmatrixboolt; i: igraphintegert;
                               j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_swap_cols".}
proc igraphmatrixboolswaprowcol*(m: ptr igraphmatrixboolt; i: igraphintegert;
                                 j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_swap_rowcol".}
proc igraphmatrixbooltranspose*(m: ptr igraphmatrixboolt): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_transpose".}
proc igraphmatrixbooladd*(m1: ptr igraphmatrixboolt; m2: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_add".}
proc igraphmatrixboolsub*(m1: ptr igraphmatrixboolt; m2: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_sub".}
proc igraphmatrixboolmulelements*(m1: ptr igraphmatrixboolt;
                                  m2: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_mul_elements".}
proc igraphmatrixbooldivelements*(m1: ptr igraphmatrixboolt;
                                  m2: ptr igraphmatrixboolt): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_div_elements".}
proc igraphmatrixboolscale*(m: ptr igraphmatrixboolt; by: igraphboolt): void {.
    cdecl, importc: "igraph_matrix_bool_scale".}
proc igraphmatrixbooladdconstant*(m: ptr igraphmatrixboolt; plus: igraphboolt): void {.
    cdecl, importc: "igraph_matrix_bool_add_constant".}
proc igraphmatrixboolalle*(lhs: ptr igraphmatrixboolt;
                           rhs: ptr igraphmatrixboolt): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_all_e".}
proc igraphmatrixboolisnull*(m: ptr igraphmatrixboolt): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_isnull".}
proc igraphmatrixboolempty*(m: ptr igraphmatrixboolt): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_empty".}
proc igraphmatrixboolsize*(m: ptr igraphmatrixboolt): igraphintegert {.cdecl,
    importc: "igraph_matrix_bool_size".}
proc igraphmatrixboolnrow*(m: ptr igraphmatrixboolt): igraphintegert {.cdecl,
    importc: "igraph_matrix_bool_nrow".}
proc igraphmatrixboolncol*(m: ptr igraphmatrixboolt): igraphintegert {.cdecl,
    importc: "igraph_matrix_bool_ncol".}
proc igraphmatrixboolissymmetric*(m: ptr igraphmatrixboolt): igraphboolt {.
    cdecl, importc: "igraph_matrix_bool_is_symmetric".}
proc igraphmatrixboolsum*(m: ptr igraphmatrixboolt): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_sum".}
proc igraphmatrixboolprod*(m: ptr igraphmatrixboolt): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_prod".}
proc igraphmatrixboolrowsum*(m: ptr igraphmatrixboolt;
                             res: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_rowsum".}
proc igraphmatrixboolcolsum*(m: ptr igraphmatrixboolt;
                             res: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_colsum".}
proc igraphmatrixboolisequal*(m1: ptr igraphmatrixboolt;
                              m2: ptr igraphmatrixboolt): igraphboolt {.cdecl,
    importc: "igraph_matrix_bool_is_equal".}
proc igraphmatrixboolcontains*(m: ptr igraphmatrixboolt; e: igraphboolt): igraphboolt {.
    cdecl, importc: "igraph_matrix_bool_contains".}
proc igraphmatrixboolsearch*(m: ptr igraphmatrixboolt; fromarg: igraphintegert;
                             what: igraphboolt; pos: ptr igraphintegert;
                             row: ptr igraphintegert; col: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_matrix_bool_search".}
proc igraphmatrixboolresize*(m: ptr igraphmatrixboolt; nrow: igraphintegert;
                             ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_resize".}
proc igraphmatrixboolresizemin*(m: ptr igraphmatrixboolt): void {.cdecl,
    importc: "igraph_matrix_bool_resize_min".}
proc igraphmatrixbooladdcols*(m: ptr igraphmatrixboolt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_add_cols".}
proc igraphmatrixbooladdrows*(m: ptr igraphmatrixboolt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_add_rows".}
proc igraphmatrixboolremovecol*(m: ptr igraphmatrixboolt; col: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_remove_col".}
proc igraphmatrixboolremoverow*(m: ptr igraphmatrixboolt; row: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_remove_row".}
proc igraphmatrixboolprint*(m: ptr igraphmatrixboolt): igrapherrort {.cdecl,
    importc: "igraph_matrix_bool_print".}
proc igraphmatrixboolfprint*(m: ptr igraphmatrixboolt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_fprint".}
proc igraphmatrixboolprintf*(m: ptr igraphmatrixboolt; format: cstring): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_printf".}
proc igraphmatrixboolpermdeleterows*(m: ptr igraphmatrixboolt;
                                     index: ptr igraphintegert;
                                     nremove: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_bool_permdelete_rows".}
proc igraphmatrixcomplexinit*(m: ptr igraphmatrixcomplext; nrow: igraphintegert;
                              ncol: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_init".}
proc igraphmatrixcomplexinitarray*(m: ptr igraphmatrixcomplext;
                                   data: ptr igraphcomplext;
                                   nrow: igraphintegert; ncol: igraphintegert;
                                   storage: igraphmatrixstoraget): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_init_array".}
proc igraphmatrixcomplexinitcopy*(to: ptr igraphmatrixcomplext;
                                  fromarg: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_init_copy".}
proc igraphmatrixcomplexdestroy*(m: ptr igraphmatrixcomplext): void {.cdecl,
    importc: "igraph_matrix_complex_destroy".}
proc igraphmatrixcomplexcapacity*(m: ptr igraphmatrixcomplext): igraphintegert {.
    cdecl, importc: "igraph_matrix_complex_capacity".}
proc igraphmatrixcomplexcopy*(to: ptr igraphmatrixcomplext;
                              fromarg: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_copy".}
proc igraphmatrixcomplexe*(m: ptr igraphmatrixcomplext; row: igraphintegert;
                           col: igraphintegert): igraphcomplext {.cdecl,
    importc: "igraph_matrix_complex_e".}
proc igraphmatrixcomplexeptr*(m: ptr igraphmatrixcomplext; row: igraphintegert;
                              col: igraphintegert): ptr igraphcomplext {.cdecl,
    importc: "igraph_matrix_complex_e_ptr".}
proc igraphmatrixcomplexget*(m: ptr igraphmatrixcomplext; row: igraphintegert;
                             col: igraphintegert): igraphcomplext {.cdecl,
    importc: "igraph_matrix_complex_get".}
proc igraphmatrixcomplexgetptr*(m: ptr igraphmatrixcomplext;
                                row: igraphintegert; col: igraphintegert): ptr igraphcomplext {.
    cdecl, importc: "igraph_matrix_complex_get_ptr".}
proc igraphmatrixcomplexset*(m: ptr igraphmatrixcomplext; row: igraphintegert;
                             col: igraphintegert; value: igraphcomplext): void {.
    cdecl, importc: "igraph_matrix_complex_set".}
proc igraphmatrixcomplexnull*(m: ptr igraphmatrixcomplext): void {.cdecl,
    importc: "igraph_matrix_complex_null".}
proc igraphmatrixcomplexfill*(m: ptr igraphmatrixcomplext; e: igraphcomplext): void {.
    cdecl, importc: "igraph_matrix_complex_fill".}
proc igraphmatrixcomplexview*(m: ptr igraphmatrixcomplext;
                              data: ptr igraphcomplext; nrow: igraphintegert;
                              ncol: igraphintegert): ptr igraphmatrixcomplext {.
    cdecl, importc: "igraph_matrix_complex_view".}
proc igraphmatrixcomplexviewfromvector*(m: ptr igraphmatrixcomplext;
                                        v: ptr igraphvectorcomplext;
                                        ncol: igraphintegert): ptr igraphmatrixcomplext {.
    cdecl, importc: "igraph_matrix_complex_view_from_vector".}
proc igraphmatrixcomplexcopyto*(m: ptr igraphmatrixcomplext;
                                to: ptr igraphcomplext): void {.cdecl,
    importc: "igraph_matrix_complex_copy_to".}
proc igraphmatrixcomplexupdate*(to: ptr igraphmatrixcomplext;
                                fromarg: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_update".}
proc igraphmatrixcomplexrbind*(to: ptr igraphmatrixcomplext;
                               fromarg: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_rbind".}
proc igraphmatrixcomplexcbind*(to: ptr igraphmatrixcomplext;
                               fromarg: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_cbind".}
proc igraphmatrixcomplexswap*(m1: ptr igraphmatrixcomplext;
                              m2: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_swap".}
proc igraphmatrixcomplexgetrow*(m: ptr igraphmatrixcomplext;
                                res: ptr igraphvectorcomplext;
                                index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_get_row".}
proc igraphmatrixcomplexgetcol*(m: ptr igraphmatrixcomplext;
                                res: ptr igraphvectorcomplext;
                                index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_get_col".}
proc igraphmatrixcomplexsetrow*(m: ptr igraphmatrixcomplext;
                                v: ptr igraphvectorcomplext;
                                index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_set_row".}
proc igraphmatrixcomplexsetcol*(m: ptr igraphmatrixcomplext;
                                v: ptr igraphvectorcomplext;
                                index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_set_col".}
proc igraphmatrixcomplexselectrows*(m: ptr igraphmatrixcomplext;
                                    res: ptr igraphmatrixcomplext;
                                    rows: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_select_rows".}
proc igraphmatrixcomplexselectcols*(m: ptr igraphmatrixcomplext;
                                    res: ptr igraphmatrixcomplext;
                                    cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_select_cols".}
proc igraphmatrixcomplexselectrowscols*(m: ptr igraphmatrixcomplext;
                                        res: ptr igraphmatrixcomplext;
                                        rows: ptr igraphvectorintt;
                                        cols: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_select_rows_cols".}
proc igraphmatrixcomplexswaprows*(m: ptr igraphmatrixcomplext;
                                  i: igraphintegert; j: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_swap_rows".}
proc igraphmatrixcomplexswapcols*(m: ptr igraphmatrixcomplext;
                                  i: igraphintegert; j: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_swap_cols".}
proc igraphmatrixcomplexswaprowcol*(m: ptr igraphmatrixcomplext;
                                    i: igraphintegert; j: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_swap_rowcol".}
proc igraphmatrixcomplextranspose*(m: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_transpose".}
proc igraphmatrixcomplexadd*(m1: ptr igraphmatrixcomplext;
                             m2: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_add".}
proc igraphmatrixcomplexsub*(m1: ptr igraphmatrixcomplext;
                             m2: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_sub".}
proc igraphmatrixcomplexmulelements*(m1: ptr igraphmatrixcomplext;
                                     m2: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_mul_elements".}
proc igraphmatrixcomplexdivelements*(m1: ptr igraphmatrixcomplext;
                                     m2: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_div_elements".}
proc igraphmatrixcomplexscale*(m: ptr igraphmatrixcomplext; by: igraphcomplext): void {.
    cdecl, importc: "igraph_matrix_complex_scale".}
proc igraphmatrixcomplexaddconstant*(m: ptr igraphmatrixcomplext;
                                     plus: igraphcomplext): void {.cdecl,
    importc: "igraph_matrix_complex_add_constant".}
proc igraphmatrixcomplexalle*(lhs: ptr igraphmatrixcomplext;
                              rhs: ptr igraphmatrixcomplext): igraphboolt {.
    cdecl, importc: "igraph_matrix_complex_all_e".}
proc igraphmatrixcomplexisnull*(m: ptr igraphmatrixcomplext): igraphboolt {.
    cdecl, importc: "igraph_matrix_complex_isnull".}
proc igraphmatrixcomplexempty*(m: ptr igraphmatrixcomplext): igraphboolt {.
    cdecl, importc: "igraph_matrix_complex_empty".}
proc igraphmatrixcomplexsize*(m: ptr igraphmatrixcomplext): igraphintegert {.
    cdecl, importc: "igraph_matrix_complex_size".}
proc igraphmatrixcomplexnrow*(m: ptr igraphmatrixcomplext): igraphintegert {.
    cdecl, importc: "igraph_matrix_complex_nrow".}
proc igraphmatrixcomplexncol*(m: ptr igraphmatrixcomplext): igraphintegert {.
    cdecl, importc: "igraph_matrix_complex_ncol".}
proc igraphmatrixcomplexissymmetric*(m: ptr igraphmatrixcomplext): igraphboolt {.
    cdecl, importc: "igraph_matrix_complex_is_symmetric".}
proc igraphmatrixcomplexsum*(m: ptr igraphmatrixcomplext): igraphcomplext {.
    cdecl, importc: "igraph_matrix_complex_sum".}
proc igraphmatrixcomplexprod*(m: ptr igraphmatrixcomplext): igraphcomplext {.
    cdecl, importc: "igraph_matrix_complex_prod".}
proc igraphmatrixcomplexrowsum*(m: ptr igraphmatrixcomplext;
                                res: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_rowsum".}
proc igraphmatrixcomplexcolsum*(m: ptr igraphmatrixcomplext;
                                res: ptr igraphvectorcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_colsum".}
proc igraphmatrixcomplexisequal*(m1: ptr igraphmatrixcomplext;
                                 m2: ptr igraphmatrixcomplext): igraphboolt {.
    cdecl, importc: "igraph_matrix_complex_is_equal".}
proc igraphmatrixcomplexcontains*(m: ptr igraphmatrixcomplext; e: igraphcomplext): igraphboolt {.
    cdecl, importc: "igraph_matrix_complex_contains".}
proc igraphmatrixcomplexsearch*(m: ptr igraphmatrixcomplext;
                                fromarg: igraphintegert; what: igraphcomplext;
                                pos: ptr igraphintegert;
                                row: ptr igraphintegert; col: ptr igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_matrix_complex_search".}
proc igraphmatrixcomplexresize*(m: ptr igraphmatrixcomplext;
                                nrow: igraphintegert; ncol: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_resize".}
proc igraphmatrixcomplexresizemin*(m: ptr igraphmatrixcomplext): void {.cdecl,
    importc: "igraph_matrix_complex_resize_min".}
proc igraphmatrixcomplexaddcols*(m: ptr igraphmatrixcomplext; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_add_cols".}
proc igraphmatrixcomplexaddrows*(m: ptr igraphmatrixcomplext; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_add_rows".}
proc igraphmatrixcomplexremovecol*(m: ptr igraphmatrixcomplext;
                                   col: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_remove_col".}
proc igraphmatrixcomplexremoverow*(m: ptr igraphmatrixcomplext;
                                   row: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_remove_row".}
proc igraphmatrixcomplexprint*(m: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_print".}
proc igraphmatrixcomplexfprint*(m: ptr igraphmatrixcomplext; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_fprint".}
proc igraphmatrixcomplexreal*(v: ptr igraphmatrixcomplext;
                              real: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_real".}
proc igraphmatrixcompleximag*(v: ptr igraphmatrixcomplext;
                              imag: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_complex_imag".}
proc igraphmatrixcomplexrealimag*(v: ptr igraphmatrixcomplext;
                                  real: ptr igraphmatrixt;
                                  imag: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_realimag".}
proc igraphmatrixcomplexcreate*(v: ptr igraphmatrixcomplext;
                                real: ptr igraphmatrixt; imag: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_create".}
proc igraphmatrixcomplexcreatepolar*(v: ptr igraphmatrixcomplext;
                                     r: ptr igraphmatrixt;
                                     theta: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_create_polar".}
proc igraphmatrixcomplexallalmoste*(lhs: ptr igraphmatrixcomplext;
                                    rhs: ptr igraphmatrixcomplext;
                                    eps: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_matrix_complex_all_almost_e".}
proc igraphmatrixcomplexpermdeleterows*(m: ptr igraphmatrixcomplext;
                                        index: ptr igraphintegert;
                                        nremove: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_permdelete_rows".}
proc igraphmatrixalletol*(lhs: ptr igraphmatrixt; rhs: ptr igraphmatrixt;
                          tol: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_matrix_all_e_tol".}
proc igraphmatrixallalmoste*(lhs: ptr igraphmatrixt; rhs: ptr igraphmatrixt;
                             eps: igraphrealt): igraphboolt {.cdecl,
    importc: "igraph_matrix_all_almost_e".}
proc igraphmatrixzapsmall*(m: ptr igraphmatrixt; tol: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_matrix_zapsmall".}
proc igraphmatrixcomplexzapsmall*(m: ptr igraphmatrixcomplext; tol: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_matrix_complex_zapsmall".}
proc igrapharray3init*(a: ptr igrapharray3t; n1: igraphintegert;
                       n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_init".}
proc igrapharray3destroy*(a: ptr igrapharray3t): void {.cdecl,
    importc: "igraph_array3_destroy".}
proc igrapharray3size*(a: ptr igrapharray3t): igraphintegert {.cdecl,
    importc: "igraph_array3_size".}
proc igrapharray3n*(a: ptr igrapharray3t; idx: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_array3_n".}
proc igrapharray3resize*(a: ptr igrapharray3t; n1: igraphintegert;
                         n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_resize".}
proc igrapharray3null*(a: ptr igrapharray3t): void {.cdecl,
    importc: "igraph_array3_null".}
proc igrapharray3sum*(a: ptr igrapharray3t): igraphrealt {.cdecl,
    importc: "igraph_array3_sum".}
proc igrapharray3scale*(a: ptr igrapharray3t; by: igraphrealt): void {.cdecl,
    importc: "igraph_array3_scale".}
proc igrapharray3fill*(a: ptr igrapharray3t; e: igraphrealt): void {.cdecl,
    importc: "igraph_array3_fill".}
proc igrapharray3update*(to: ptr igrapharray3t; fromarg: ptr igrapharray3t): igrapherrort {.
    cdecl, importc: "igraph_array3_update".}
proc igrapharray3intinit*(a: ptr igrapharray3intt; n1: igraphintegert;
                          n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_int_init".}
proc igrapharray3intdestroy*(a: ptr igrapharray3intt): void {.cdecl,
    importc: "igraph_array3_int_destroy".}
proc igrapharray3intsize*(a: ptr igrapharray3intt): igraphintegert {.cdecl,
    importc: "igraph_array3_int_size".}
proc igrapharray3intn*(a: ptr igrapharray3intt; idx: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_array3_int_n".}
proc igrapharray3intresize*(a: ptr igrapharray3intt; n1: igraphintegert;
                            n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_int_resize".}
proc igrapharray3intnull*(a: ptr igrapharray3intt): void {.cdecl,
    importc: "igraph_array3_int_null".}
proc igrapharray3intsum*(a: ptr igrapharray3intt): igraphintegert {.cdecl,
    importc: "igraph_array3_int_sum".}
proc igrapharray3intscale*(a: ptr igrapharray3intt; by: igraphintegert): void {.
    cdecl, importc: "igraph_array3_int_scale".}
proc igrapharray3intfill*(a: ptr igrapharray3intt; e: igraphintegert): void {.
    cdecl, importc: "igraph_array3_int_fill".}
proc igrapharray3intupdate*(to: ptr igrapharray3intt;
                            fromarg: ptr igrapharray3intt): igrapherrort {.
    cdecl, importc: "igraph_array3_int_update".}
proc igrapharray3charinit*(a: ptr igrapharray3chart; n1: igraphintegert;
                           n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_char_init".}
proc igrapharray3chardestroy*(a: ptr igrapharray3chart): void {.cdecl,
    importc: "igraph_array3_char_destroy".}
proc igrapharray3charsize*(a: ptr igrapharray3chart): igraphintegert {.cdecl,
    importc: "igraph_array3_char_size".}
proc igrapharray3charn*(a: ptr igrapharray3chart; idx: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_array3_char_n".}
proc igrapharray3charresize*(a: ptr igrapharray3chart; n1: igraphintegert;
                             n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_char_resize".}
proc igrapharray3charnull*(a: ptr igrapharray3chart): void {.cdecl,
    importc: "igraph_array3_char_null".}
proc igrapharray3charsum*(a: ptr igrapharray3chart): cschar {.cdecl,
    importc: "igraph_array3_char_sum".}
proc igrapharray3charscale*(a: ptr igrapharray3chart; by: cschar): void {.cdecl,
    importc: "igraph_array3_char_scale".}
proc igrapharray3charfill*(a: ptr igrapharray3chart; e: cschar): void {.cdecl,
    importc: "igraph_array3_char_fill".}
proc igrapharray3charupdate*(to: ptr igrapharray3chart;
                             fromarg: ptr igrapharray3chart): igrapherrort {.
    cdecl, importc: "igraph_array3_char_update".}
proc igrapharray3boolinit*(a: ptr igrapharray3boolt; n1: igraphintegert;
                           n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_bool_init".}
proc igrapharray3booldestroy*(a: ptr igrapharray3boolt): void {.cdecl,
    importc: "igraph_array3_bool_destroy".}
proc igrapharray3boolsize*(a: ptr igrapharray3boolt): igraphintegert {.cdecl,
    importc: "igraph_array3_bool_size".}
proc igrapharray3booln*(a: ptr igrapharray3boolt; idx: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_array3_bool_n".}
proc igrapharray3boolresize*(a: ptr igrapharray3boolt; n1: igraphintegert;
                             n2: igraphintegert; n3: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_array3_bool_resize".}
proc igrapharray3boolnull*(a: ptr igrapharray3boolt): void {.cdecl,
    importc: "igraph_array3_bool_null".}
proc igrapharray3boolsum*(a: ptr igrapharray3boolt): igraphboolt {.cdecl,
    importc: "igraph_array3_bool_sum".}
proc igrapharray3boolscale*(a: ptr igrapharray3boolt; by: igraphboolt): void {.
    cdecl, importc: "igraph_array3_bool_scale".}
proc igrapharray3boolfill*(a: ptr igrapharray3boolt; e: igraphboolt): void {.
    cdecl, importc: "igraph_array3_bool_fill".}
proc igrapharray3boolupdate*(to: ptr igrapharray3boolt;
                             fromarg: ptr igrapharray3boolt): igrapherrort {.
    cdecl, importc: "igraph_array3_bool_update".}
proc igraphbitsetinit*(bitset: ptr igraphbitsett; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_bitset_init".}
proc igraphbitsetdestroy*(bitset: ptr igraphbitsett): void {.cdecl,
    importc: "igraph_bitset_destroy".}
proc igraphbitsetinitcopy*(dest: ptr igraphbitsett; src: ptr igraphbitsett): igrapherrort {.
    cdecl, importc: "igraph_bitset_init_copy".}
proc igraphbitsetcapacity*(bitset: ptr igraphbitsett): igraphintegert {.cdecl,
    importc: "igraph_bitset_capacity".}
proc igraphbitsetsize*(bitset: ptr igraphbitsett): igraphintegert {.cdecl,
    importc: "igraph_bitset_size".}
proc igraphbitsetreserve*(bitset: ptr igraphbitsett; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_bitset_reserve".}
proc igraphbitsetresize*(bitset: ptr igraphbitsett; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_bitset_resize".}
proc igraphbitsetpopcount*(bitset: ptr igraphbitsett): igraphintegert {.cdecl,
    importc: "igraph_bitset_popcount".}
proc igraphbitsetcountlzero*(bitset: ptr igraphbitsett): igraphintegert {.cdecl,
    importc: "igraph_bitset_countl_zero".}
proc igraphbitsetcountlone*(bitset: ptr igraphbitsett): igraphintegert {.cdecl,
    importc: "igraph_bitset_countl_one".}
proc igraphbitsetcountrzero*(bitset: ptr igraphbitsett): igraphintegert {.cdecl,
    importc: "igraph_bitset_countr_zero".}
proc igraphbitsetcountrone*(bitset: ptr igraphbitsett): igraphintegert {.cdecl,
    importc: "igraph_bitset_countr_one".}
proc igraphbitsetor*(dest: ptr igraphbitsett; src1: ptr igraphbitsett;
                     src2: ptr igraphbitsett): void {.cdecl,
    importc: "igraph_bitset_or".}
proc igraphbitsetand*(dest: ptr igraphbitsett; src1: ptr igraphbitsett;
                      src2: ptr igraphbitsett): void {.cdecl,
    importc: "igraph_bitset_and".}
proc igraphbitsetxor*(dest: ptr igraphbitsett; src1: ptr igraphbitsett;
                      src2: ptr igraphbitsett): void {.cdecl,
    importc: "igraph_bitset_xor".}
proc igraphbitsetnot*(dest: ptr igraphbitsett; src: ptr igraphbitsett): void {.
    cdecl, importc: "igraph_bitset_not".}
proc igraphbitsetfprint*(bitset: ptr igraphbitsett; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_bitset_fprint".}
proc igraphbitsetprint*(bitset: ptr igraphbitsett): igrapherrort {.cdecl,
    importc: "igraph_bitset_print".}
proc igraphdqueueinit*(q: ptr igraphdqueuet; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_dqueue_init".}
proc igraphdqueuedestroy*(q: ptr igraphdqueuet): void {.cdecl,
    importc: "igraph_dqueue_destroy".}
proc igraphdqueueempty*(q: ptr igraphdqueuet): igraphboolt {.cdecl,
    importc: "igraph_dqueue_empty".}
proc igraphdqueueclear*(q: ptr igraphdqueuet): void {.cdecl,
    importc: "igraph_dqueue_clear".}
proc igraphdqueuefull*(q: ptr igraphdqueuet): igraphboolt {.cdecl,
    importc: "igraph_dqueue_full".}
proc igraphdqueuesize*(q: ptr igraphdqueuet): igraphintegert {.cdecl,
    importc: "igraph_dqueue_size".}
proc igraphdqueuepop*(q: ptr igraphdqueuet): igraphrealt {.cdecl,
    importc: "igraph_dqueue_pop".}
proc igraphdqueuepopback*(q: ptr igraphdqueuet): igraphrealt {.cdecl,
    importc: "igraph_dqueue_pop_back".}
proc igraphdqueuehead*(q: ptr igraphdqueuet): igraphrealt {.cdecl,
    importc: "igraph_dqueue_head".}
proc igraphdqueueback*(q: ptr igraphdqueuet): igraphrealt {.cdecl,
    importc: "igraph_dqueue_back".}
proc igraphdqueuepush*(q: ptr igraphdqueuet; elem: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_dqueue_push".}
proc igraphdqueueprint*(q: ptr igraphdqueuet): igrapherrort {.cdecl,
    importc: "igraph_dqueue_print".}
proc igraphdqueuefprint*(q: ptr igraphdqueuet; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_dqueue_fprint".}
proc igraphdqueueget*(q: ptr igraphdqueuet; idx: igraphintegert): igraphrealt {.
    cdecl, importc: "igraph_dqueue_get".}
proc igraphdqueuee*(q: ptr igraphdqueuet; idx: igraphintegert): igraphrealt {.
    cdecl, importc: "igraph_dqueue_e".}
proc igraphdqueuecharinit*(q: ptr igraphdqueuechart; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_dqueue_char_init".}
proc igraphdqueuechardestroy*(q: ptr igraphdqueuechart): void {.cdecl,
    importc: "igraph_dqueue_char_destroy".}
proc igraphdqueuecharempty*(q: ptr igraphdqueuechart): igraphboolt {.cdecl,
    importc: "igraph_dqueue_char_empty".}
proc igraphdqueuecharclear*(q: ptr igraphdqueuechart): void {.cdecl,
    importc: "igraph_dqueue_char_clear".}
proc igraphdqueuecharfull*(q: ptr igraphdqueuechart): igraphboolt {.cdecl,
    importc: "igraph_dqueue_char_full".}
proc igraphdqueuecharsize*(q: ptr igraphdqueuechart): igraphintegert {.cdecl,
    importc: "igraph_dqueue_char_size".}
proc igraphdqueuecharpop*(q: ptr igraphdqueuechart): cschar {.cdecl,
    importc: "igraph_dqueue_char_pop".}
proc igraphdqueuecharpopback*(q: ptr igraphdqueuechart): cschar {.cdecl,
    importc: "igraph_dqueue_char_pop_back".}
proc igraphdqueuecharhead*(q: ptr igraphdqueuechart): cschar {.cdecl,
    importc: "igraph_dqueue_char_head".}
proc igraphdqueuecharback*(q: ptr igraphdqueuechart): cschar {.cdecl,
    importc: "igraph_dqueue_char_back".}
proc igraphdqueuecharpush*(q: ptr igraphdqueuechart; elem: cschar): igrapherrort {.
    cdecl, importc: "igraph_dqueue_char_push".}
proc igraphdqueuecharprint*(q: ptr igraphdqueuechart): igrapherrort {.cdecl,
    importc: "igraph_dqueue_char_print".}
proc igraphdqueuecharfprint*(q: ptr igraphdqueuechart; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_dqueue_char_fprint".}
proc igraphdqueuecharget*(q: ptr igraphdqueuechart; idx: igraphintegert): cschar {.
    cdecl, importc: "igraph_dqueue_char_get".}
proc igraphdqueuechare*(q: ptr igraphdqueuechart; idx: igraphintegert): cschar {.
    cdecl, importc: "igraph_dqueue_char_e".}
proc igraphdqueueboolinit*(q: ptr igraphdqueueboolt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_dqueue_bool_init".}
proc igraphdqueuebooldestroy*(q: ptr igraphdqueueboolt): void {.cdecl,
    importc: "igraph_dqueue_bool_destroy".}
proc igraphdqueueboolempty*(q: ptr igraphdqueueboolt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_bool_empty".}
proc igraphdqueueboolclear*(q: ptr igraphdqueueboolt): void {.cdecl,
    importc: "igraph_dqueue_bool_clear".}
proc igraphdqueueboolfull*(q: ptr igraphdqueueboolt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_bool_full".}
proc igraphdqueueboolsize*(q: ptr igraphdqueueboolt): igraphintegert {.cdecl,
    importc: "igraph_dqueue_bool_size".}
proc igraphdqueueboolpop*(q: ptr igraphdqueueboolt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_bool_pop".}
proc igraphdqueueboolpopback*(q: ptr igraphdqueueboolt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_bool_pop_back".}
proc igraphdqueueboolhead*(q: ptr igraphdqueueboolt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_bool_head".}
proc igraphdqueueboolback*(q: ptr igraphdqueueboolt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_bool_back".}
proc igraphdqueueboolpush*(q: ptr igraphdqueueboolt; elem: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_dqueue_bool_push".}
proc igraphdqueueboolprint*(q: ptr igraphdqueueboolt): igrapherrort {.cdecl,
    importc: "igraph_dqueue_bool_print".}
proc igraphdqueueboolfprint*(q: ptr igraphdqueueboolt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_dqueue_bool_fprint".}
proc igraphdqueueboolget*(q: ptr igraphdqueueboolt; idx: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_dqueue_bool_get".}
proc igraphdqueueboole*(q: ptr igraphdqueueboolt; idx: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_dqueue_bool_e".}
proc igraphdqueueintinit*(q: ptr igraphdqueueintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_dqueue_int_init".}
proc igraphdqueueintdestroy*(q: ptr igraphdqueueintt): void {.cdecl,
    importc: "igraph_dqueue_int_destroy".}
proc igraphdqueueintempty*(q: ptr igraphdqueueintt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_int_empty".}
proc igraphdqueueintclear*(q: ptr igraphdqueueintt): void {.cdecl,
    importc: "igraph_dqueue_int_clear".}
proc igraphdqueueintfull*(q: ptr igraphdqueueintt): igraphboolt {.cdecl,
    importc: "igraph_dqueue_int_full".}
proc igraphdqueueintsize*(q: ptr igraphdqueueintt): igraphintegert {.cdecl,
    importc: "igraph_dqueue_int_size".}
proc igraphdqueueintpop*(q: ptr igraphdqueueintt): igraphintegert {.cdecl,
    importc: "igraph_dqueue_int_pop".}
proc igraphdqueueintpopback*(q: ptr igraphdqueueintt): igraphintegert {.cdecl,
    importc: "igraph_dqueue_int_pop_back".}
proc igraphdqueueinthead*(q: ptr igraphdqueueintt): igraphintegert {.cdecl,
    importc: "igraph_dqueue_int_head".}
proc igraphdqueueintback*(q: ptr igraphdqueueintt): igraphintegert {.cdecl,
    importc: "igraph_dqueue_int_back".}
proc igraphdqueueintpush*(q: ptr igraphdqueueintt; elem: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_dqueue_int_push".}
proc igraphdqueueintprint*(q: ptr igraphdqueueintt): igrapherrort {.cdecl,
    importc: "igraph_dqueue_int_print".}
proc igraphdqueueintfprint*(q: ptr igraphdqueueintt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_dqueue_int_fprint".}
proc igraphdqueueintget*(q: ptr igraphdqueueintt; idx: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_dqueue_int_get".}
proc igraphdqueueinte*(q: ptr igraphdqueueintt; idx: igraphintegert): igraphintegert {.
    cdecl, importc: "igraph_dqueue_int_e".}
proc igraphstackinit*(s: ptr igraphstackt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_init".}
proc igraphstackdestroy*(s: ptr igraphstackt): void {.cdecl,
    importc: "igraph_stack_destroy".}
proc igraphstackreserve*(s: ptr igraphstackt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_reserve".}
proc igraphstackempty*(s: ptr igraphstackt): igraphboolt {.cdecl,
    importc: "igraph_stack_empty".}
proc igraphstacksize*(s: ptr igraphstackt): igraphintegert {.cdecl,
    importc: "igraph_stack_size".}
proc igraphstackclear*(s: ptr igraphstackt): void {.cdecl,
    importc: "igraph_stack_clear".}
proc igraphstackpush*(s: ptr igraphstackt; elem: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_stack_push".}
proc igraphstackpop*(s: ptr igraphstackt): igraphrealt {.cdecl,
    importc: "igraph_stack_pop".}
proc igraphstacktop*(s: ptr igraphstackt): igraphrealt {.cdecl,
    importc: "igraph_stack_top".}
proc igraphstackprint*(s: ptr igraphstackt): igrapherrort {.cdecl,
    importc: "igraph_stack_print".}
proc igraphstackfprint*(s: ptr igraphstackt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_stack_fprint".}
proc igraphstackintinit*(s: ptr igraphstackintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_int_init".}
proc igraphstackintdestroy*(s: ptr igraphstackintt): void {.cdecl,
    importc: "igraph_stack_int_destroy".}
proc igraphstackintreserve*(s: ptr igraphstackintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_int_reserve".}
proc igraphstackintempty*(s: ptr igraphstackintt): igraphboolt {.cdecl,
    importc: "igraph_stack_int_empty".}
proc igraphstackintsize*(s: ptr igraphstackintt): igraphintegert {.cdecl,
    importc: "igraph_stack_int_size".}
proc igraphstackintclear*(s: ptr igraphstackintt): void {.cdecl,
    importc: "igraph_stack_int_clear".}
proc igraphstackintpush*(s: ptr igraphstackintt; elem: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_int_push".}
proc igraphstackintpop*(s: ptr igraphstackintt): igraphintegert {.cdecl,
    importc: "igraph_stack_int_pop".}
proc igraphstackinttop*(s: ptr igraphstackintt): igraphintegert {.cdecl,
    importc: "igraph_stack_int_top".}
proc igraphstackintprint*(s: ptr igraphstackintt): igrapherrort {.cdecl,
    importc: "igraph_stack_int_print".}
proc igraphstackintfprint*(s: ptr igraphstackintt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_stack_int_fprint".}
proc igraphstackcharinit*(s: ptr igraphstackchart; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_char_init".}
proc igraphstackchardestroy*(s: ptr igraphstackchart): void {.cdecl,
    importc: "igraph_stack_char_destroy".}
proc igraphstackcharreserve*(s: ptr igraphstackchart; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_char_reserve".}
proc igraphstackcharempty*(s: ptr igraphstackchart): igraphboolt {.cdecl,
    importc: "igraph_stack_char_empty".}
proc igraphstackcharsize*(s: ptr igraphstackchart): igraphintegert {.cdecl,
    importc: "igraph_stack_char_size".}
proc igraphstackcharclear*(s: ptr igraphstackchart): void {.cdecl,
    importc: "igraph_stack_char_clear".}
proc igraphstackcharpush*(s: ptr igraphstackchart; elem: cschar): igrapherrort {.
    cdecl, importc: "igraph_stack_char_push".}
proc igraphstackcharpop*(s: ptr igraphstackchart): cschar {.cdecl,
    importc: "igraph_stack_char_pop".}
proc igraphstackchartop*(s: ptr igraphstackchart): cschar {.cdecl,
    importc: "igraph_stack_char_top".}
proc igraphstackcharprint*(s: ptr igraphstackchart): igrapherrort {.cdecl,
    importc: "igraph_stack_char_print".}
proc igraphstackcharfprint*(s: ptr igraphstackchart; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_stack_char_fprint".}
proc igraphstackboolinit*(s: ptr igraphstackboolt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_bool_init".}
proc igraphstackbooldestroy*(s: ptr igraphstackboolt): void {.cdecl,
    importc: "igraph_stack_bool_destroy".}
proc igraphstackboolreserve*(s: ptr igraphstackboolt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_stack_bool_reserve".}
proc igraphstackboolempty*(s: ptr igraphstackboolt): igraphboolt {.cdecl,
    importc: "igraph_stack_bool_empty".}
proc igraphstackboolsize*(s: ptr igraphstackboolt): igraphintegert {.cdecl,
    importc: "igraph_stack_bool_size".}
proc igraphstackboolclear*(s: ptr igraphstackboolt): void {.cdecl,
    importc: "igraph_stack_bool_clear".}
proc igraphstackboolpush*(s: ptr igraphstackboolt; elem: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_stack_bool_push".}
proc igraphstackboolpop*(s: ptr igraphstackboolt): igraphboolt {.cdecl,
    importc: "igraph_stack_bool_pop".}
proc igraphstackbooltop*(s: ptr igraphstackboolt): igraphboolt {.cdecl,
    importc: "igraph_stack_bool_top".}
proc igraphstackboolprint*(s: ptr igraphstackboolt): igrapherrort {.cdecl,
    importc: "igraph_stack_bool_print".}
proc igraphstackboolfprint*(s: ptr igraphstackboolt; file: ptr File): igrapherrort {.
    cdecl, importc: "igraph_stack_bool_fprint".}
proc igraphheapinit*(h: ptr igraphheapt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_init".}
proc igraphheapinitarray*(t: ptr igraphheapt; data: ptr igraphrealt;
                          len: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_heap_init_array".}
proc igraphheapdestroy*(h: ptr igraphheapt): void {.cdecl,
    importc: "igraph_heap_destroy".}
proc igraphheapclear*(h: ptr igraphheapt): void {.cdecl,
    importc: "igraph_heap_clear".}
proc igraphheapempty*(h: ptr igraphheapt): igraphboolt {.cdecl,
    importc: "igraph_heap_empty".}
proc igraphheappush*(h: ptr igraphheapt; elem: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_heap_push".}
proc igraphheaptop*(h: ptr igraphheapt): igraphrealt {.cdecl,
    importc: "igraph_heap_top".}
proc igraphheapdeletetop*(h: ptr igraphheapt): igraphrealt {.cdecl,
    importc: "igraph_heap_delete_top".}
proc igraphheapsize*(h: ptr igraphheapt): igraphintegert {.cdecl,
    importc: "igraph_heap_size".}
proc igraphheapreserve*(h: ptr igraphheapt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_reserve".}
proc igraphheapmininit*(h: ptr igraphheapmint; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_min_init".}
proc igraphheapmininitarray*(t: ptr igraphheapmint; data: ptr igraphrealt;
                             len: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_heap_min_init_array".}
proc igraphheapmindestroy*(h: ptr igraphheapmint): void {.cdecl,
    importc: "igraph_heap_min_destroy".}
proc igraphheapminclear*(h: ptr igraphheapmint): void {.cdecl,
    importc: "igraph_heap_min_clear".}
proc igraphheapminempty*(h: ptr igraphheapmint): igraphboolt {.cdecl,
    importc: "igraph_heap_min_empty".}
proc igraphheapminpush*(h: ptr igraphheapmint; elem: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_heap_min_push".}
proc igraphheapmintop*(h: ptr igraphheapmint): igraphrealt {.cdecl,
    importc: "igraph_heap_min_top".}
proc igraphheapmindeletetop*(h: ptr igraphheapmint): igraphrealt {.cdecl,
    importc: "igraph_heap_min_delete_top".}
proc igraphheapminsize*(h: ptr igraphheapmint): igraphintegert {.cdecl,
    importc: "igraph_heap_min_size".}
proc igraphheapminreserve*(h: ptr igraphheapmint; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_min_reserve".}
proc igraphheapintinit*(h: ptr igraphheapintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_int_init".}
proc igraphheapintinitarray*(t: ptr igraphheapintt; data: ptr igraphintegert;
                             len: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_heap_int_init_array".}
proc igraphheapintdestroy*(h: ptr igraphheapintt): void {.cdecl,
    importc: "igraph_heap_int_destroy".}
proc igraphheapintclear*(h: ptr igraphheapintt): void {.cdecl,
    importc: "igraph_heap_int_clear".}
proc igraphheapintempty*(h: ptr igraphheapintt): igraphboolt {.cdecl,
    importc: "igraph_heap_int_empty".}
proc igraphheapintpush*(h: ptr igraphheapintt; elem: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_int_push".}
proc igraphheapinttop*(h: ptr igraphheapintt): igraphintegert {.cdecl,
    importc: "igraph_heap_int_top".}
proc igraphheapintdeletetop*(h: ptr igraphheapintt): igraphintegert {.cdecl,
    importc: "igraph_heap_int_delete_top".}
proc igraphheapintsize*(h: ptr igraphheapintt): igraphintegert {.cdecl,
    importc: "igraph_heap_int_size".}
proc igraphheapintreserve*(h: ptr igraphheapintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_int_reserve".}
proc igraphheapminintinit*(h: ptr igraphheapminintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_min_int_init".}
proc igraphheapminintinitarray*(t: ptr igraphheapminintt;
                                data: ptr igraphintegert; len: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_min_int_init_array".}
proc igraphheapminintdestroy*(h: ptr igraphheapminintt): void {.cdecl,
    importc: "igraph_heap_min_int_destroy".}
proc igraphheapminintclear*(h: ptr igraphheapminintt): void {.cdecl,
    importc: "igraph_heap_min_int_clear".}
proc igraphheapminintempty*(h: ptr igraphheapminintt): igraphboolt {.cdecl,
    importc: "igraph_heap_min_int_empty".}
proc igraphheapminintpush*(h: ptr igraphheapminintt; elem: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_min_int_push".}
proc igraphheapmininttop*(h: ptr igraphheapminintt): igraphintegert {.cdecl,
    importc: "igraph_heap_min_int_top".}
proc igraphheapminintdeletetop*(h: ptr igraphheapminintt): igraphintegert {.
    cdecl, importc: "igraph_heap_min_int_delete_top".}
proc igraphheapminintsize*(h: ptr igraphheapminintt): igraphintegert {.cdecl,
    importc: "igraph_heap_min_int_size".}
proc igraphheapminintreserve*(h: ptr igraphheapminintt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_min_int_reserve".}
proc igraphheapcharinit*(h: ptr igraphheapchart; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_char_init".}
proc igraphheapcharinitarray*(t: ptr igraphheapchart; data: cstring;
                              len: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_heap_char_init_array".}
proc igraphheapchardestroy*(h: ptr igraphheapchart): void {.cdecl,
    importc: "igraph_heap_char_destroy".}
proc igraphheapcharclear*(h: ptr igraphheapchart): void {.cdecl,
    importc: "igraph_heap_char_clear".}
proc igraphheapcharempty*(h: ptr igraphheapchart): igraphboolt {.cdecl,
    importc: "igraph_heap_char_empty".}
proc igraphheapcharpush*(h: ptr igraphheapchart; elem: cschar): igrapherrort {.
    cdecl, importc: "igraph_heap_char_push".}
proc igraphheapchartop*(h: ptr igraphheapchart): cschar {.cdecl,
    importc: "igraph_heap_char_top".}
proc igraphheapchardeletetop*(h: ptr igraphheapchart): cschar {.cdecl,
    importc: "igraph_heap_char_delete_top".}
proc igraphheapcharsize*(h: ptr igraphheapchart): igraphintegert {.cdecl,
    importc: "igraph_heap_char_size".}
proc igraphheapcharreserve*(h: ptr igraphheapchart; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_char_reserve".}
proc igraphheapmincharinit*(h: ptr igraphheapminchart; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_heap_min_char_init".}
proc igraphheapmincharinitarray*(t: ptr igraphheapminchart; data: cstring;
                                 len: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_heap_min_char_init_array".}
proc igraphheapminchardestroy*(h: ptr igraphheapminchart): void {.cdecl,
    importc: "igraph_heap_min_char_destroy".}
proc igraphheapmincharclear*(h: ptr igraphheapminchart): void {.cdecl,
    importc: "igraph_heap_min_char_clear".}
proc igraphheapmincharempty*(h: ptr igraphheapminchart): igraphboolt {.cdecl,
    importc: "igraph_heap_min_char_empty".}
proc igraphheapmincharpush*(h: ptr igraphheapminchart; elem: cschar): igrapherrort {.
    cdecl, importc: "igraph_heap_min_char_push".}
proc igraphheapminchartop*(h: ptr igraphheapminchart): cschar {.cdecl,
    importc: "igraph_heap_min_char_top".}
proc igraphheapminchardeletetop*(h: ptr igraphheapminchart): cschar {.cdecl,
    importc: "igraph_heap_min_char_delete_top".}
proc igraphheapmincharsize*(h: ptr igraphheapminchart): igraphintegert {.cdecl,
    importc: "igraph_heap_min_char_size".}
proc igraphheapmincharreserve*(h: ptr igraphheapminchart;
                               capacity: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_heap_min_char_reserve".}
proc igraphpsumtreeinit*(t: ptr igraphpsumtreet; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_psumtree_init".}
proc igraphpsumtreereset*(t: ptr igraphpsumtreet): void {.cdecl,
    importc: "igraph_psumtree_reset".}
proc igraphpsumtreedestroy*(t: ptr igraphpsumtreet): void {.cdecl,
    importc: "igraph_psumtree_destroy".}
proc igraphpsumtreeget*(t: ptr igraphpsumtreet; idx: igraphintegert): igraphrealt {.
    cdecl, importc: "igraph_psumtree_get".}
proc igraphpsumtreesize*(t: ptr igraphpsumtreet): igraphintegert {.cdecl,
    importc: "igraph_psumtree_size".}
proc igraphpsumtreesearch*(t: ptr igraphpsumtreet; idx: ptr igraphintegert;
                           elem: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_psumtree_search".}
proc igraphpsumtreeupdate*(t: ptr igraphpsumtreet; idx: igraphintegert;
                           newvalue: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_psumtree_update".}
proc igraphpsumtreesum*(t: ptr igraphpsumtreet): igraphrealt {.cdecl,
    importc: "igraph_psumtree_sum".}
proc igraphstrvectorinit*(sv: ptr igraphstrvectort; len: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_strvector_init".}
proc igraphstrvectordestroy*(sv: ptr igraphstrvectort): void {.cdecl,
    importc: "igraph_strvector_destroy".}
proc igraphstrvectorsize*(sv: ptr igraphstrvectort): igraphintegert {.cdecl,
    importc: "igraph_strvector_size".}
proc igraphstrvectorcapacity*(sv: ptr igraphstrvectort): igraphintegert {.cdecl,
    importc: "igraph_strvector_capacity".}
proc igraphstrvectorget*(sv: ptr igraphstrvectort; idx: igraphintegert): cstring {.
    cdecl, importc: "igraph_strvector_get".}
proc igraphstrvectorset*(sv: ptr igraphstrvectort; idx: igraphintegert;
                         value: cstring): igrapherrort {.cdecl,
    importc: "igraph_strvector_set".}
proc igraphstrvectorsetlen*(sv: ptr igraphstrvectort; idx: igraphintegert;
                            value: cstring; len: csize_t): igrapherrort {.cdecl,
    importc: "igraph_strvector_set_len".}
proc igraphstrvectorclear*(sv: ptr igraphstrvectort): void {.cdecl,
    importc: "igraph_strvector_clear".}
proc igraphstrvectorremovesection*(v: ptr igraphstrvectort;
                                   fromarg: igraphintegert; to: igraphintegert): void {.
    cdecl, importc: "igraph_strvector_remove_section".}
proc igraphstrvectorremove*(v: ptr igraphstrvectort; elem: igraphintegert): void {.
    cdecl, importc: "igraph_strvector_remove".}
proc igraphstrvectorinitcopy*(to: ptr igraphstrvectort;
                              fromarg: ptr igraphstrvectort): igrapherrort {.
    cdecl, importc: "igraph_strvector_init_copy".}
proc igraphstrvectorappend*(to: ptr igraphstrvectort;
                            fromarg: ptr igraphstrvectort): igrapherrort {.
    cdecl, importc: "igraph_strvector_append".}
proc igraphstrvectormerge*(to: ptr igraphstrvectort;
                           fromarg: ptr igraphstrvectort): igrapherrort {.cdecl,
    importc: "igraph_strvector_merge".}
proc igraphstrvectorresize*(v: ptr igraphstrvectort; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_strvector_resize".}
proc igraphstrvectorpushback*(v: ptr igraphstrvectort; value: cstring): igrapherrort {.
    cdecl, importc: "igraph_strvector_push_back".}
proc igraphstrvectorpushbacklen*(v: ptr igraphstrvectort; value: cstring;
                                 len: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_strvector_push_back_len".}
proc igraphstrvectorprint*(v: ptr igraphstrvectort; file: ptr File; sep: cstring): igrapherrort {.
    cdecl, importc: "igraph_strvector_print".}
proc igraphstrvectorindex*(v: ptr igraphstrvectort; newv: ptr igraphstrvectort;
                           idx: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_strvector_index".}
proc igraphstrvectorreserve*(sv: ptr igraphstrvectort; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_strvector_reserve".}
proc igraphstrvectoradd*(v: ptr igraphstrvectort; value: cstring): igrapherrort {.
    cdecl, importc: "igraph_strvector_add".}
proc igraphstrvectorcopy*(to: ptr igraphstrvectort;
                          fromarg: ptr igraphstrvectort): igrapherrort {.cdecl,
    importc: "igraph_strvector_copy".}
proc igraphstrvectorset2*(sv: ptr igraphstrvectort; idx: igraphintegert;
                          value: cstring; len: csize_t): igrapherrort {.cdecl,
    importc: "igraph_strvector_set2".}
proc igraphvectorlistinit*(v: ptr igraphvectorlistt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_list_init".}
proc igraphvectorlistdestroy*(v: ptr igraphvectorlistt): void {.cdecl,
    importc: "igraph_vector_list_destroy".}
proc igraphvectorlistgetptr*(v: ptr igraphvectorlistt; pos: igraphintegert): ptr igraphvectort {.
    cdecl, importc: "igraph_vector_list_get_ptr".}
proc igraphvectorlistset*(v: ptr igraphvectorlistt; pos: igraphintegert;
                          e: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_list_set".}
proc igraphvectorlisttailptr*(v: ptr igraphvectorlistt): ptr igraphvectort {.
    cdecl, importc: "igraph_vector_list_tail_ptr".}
proc igraphvectorlistcapacity*(v: ptr igraphvectorlistt): igraphintegert {.
    cdecl, importc: "igraph_vector_list_capacity".}
proc igraphvectorlistempty*(v: ptr igraphvectorlistt): igraphboolt {.cdecl,
    importc: "igraph_vector_list_empty".}
proc igraphvectorlistsize*(v: ptr igraphvectorlistt): igraphintegert {.cdecl,
    importc: "igraph_vector_list_size".}
proc igraphvectorlistclear*(v: ptr igraphvectorlistt): void {.cdecl,
    importc: "igraph_vector_list_clear".}
proc igraphvectorlistreserve*(v: ptr igraphvectorlistt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_list_reserve".}
proc igraphvectorlistresize*(v: ptr igraphvectorlistt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_list_resize".}
proc igraphvectorlistdiscard*(v: ptr igraphvectorlistt; index: igraphintegert): void {.
    cdecl, importc: "igraph_vector_list_discard".}
proc igraphvectorlistdiscardback*(v: ptr igraphvectorlistt): void {.cdecl,
    importc: "igraph_vector_list_discard_back".}
proc igraphvectorlistdiscardfast*(v: ptr igraphvectorlistt;
                                  index: igraphintegert): void {.cdecl,
    importc: "igraph_vector_list_discard_fast".}
proc igraphvectorlistinsert*(v: ptr igraphvectorlistt; pos: igraphintegert;
                             e: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_list_insert".}
proc igraphvectorlistinsertcopy*(v: ptr igraphvectorlistt; pos: igraphintegert;
                                 e: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_list_insert_copy".}
proc igraphvectorlistinsertnew*(v: ptr igraphvectorlistt; pos: igraphintegert;
                                result: ptr ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_list_insert_new".}
proc igraphvectorlistpushback*(v: ptr igraphvectorlistt; e: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_list_push_back".}
proc igraphvectorlistpushbackcopy*(v: ptr igraphvectorlistt;
                                   e: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_list_push_back_copy".}
proc igraphvectorlistpushbacknew*(v: ptr igraphvectorlistt;
                                  result: ptr ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_list_push_back_new".}
proc igraphvectorlistpopback*(v: ptr igraphvectorlistt): igraphvectort {.cdecl,
    importc: "igraph_vector_list_pop_back".}
proc igraphvectorlistremove*(v: ptr igraphvectorlistt; index: igraphintegert;
                             e: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_vector_list_remove".}
proc igraphvectorlistremovefast*(v: ptr igraphvectorlistt;
                                 index: igraphintegert; e: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_vector_list_remove_fast".}
proc igraphvectorlistreplace*(v: ptr igraphvectorlistt; pos: igraphintegert;
                              e: ptr igraphvectort): void {.cdecl,
    importc: "igraph_vector_list_replace".}
proc igraphvectorlistremoveconsecutiveduplicates*(v: ptr igraphvectorlistt; eq: proc (
    a0: ptr igraphvectort; a1: ptr igraphvectort): igraphboolt {.cdecl.}): void {.
    cdecl, importc: "igraph_vector_list_remove_consecutive_duplicates".}
proc igraphvectorlistpermute*(v: ptr igraphvectorlistt;
                              index: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_list_permute".}
proc igraphvectorlistreverse*(v: ptr igraphvectorlistt): igrapherrort {.cdecl,
    importc: "igraph_vector_list_reverse".}
proc igraphvectorlistswap*(v1: ptr igraphvectorlistt; v2: ptr igraphvectorlistt): igrapherrort {.
    cdecl, importc: "igraph_vector_list_swap".}
proc igraphvectorlistswapelements*(v: ptr igraphvectorlistt; i: igraphintegert;
                                   j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_list_swap_elements".}
proc igraphvectorlistsort*(v: ptr igraphvectorlistt; cmp: proc (
    a0: ptr igraphvectort; a1: ptr igraphvectort): cint {.cdecl.}): void {.
    cdecl, importc: "igraph_vector_list_sort".}
proc igraphvectorlistsortind*(v: ptr igraphvectorlistt;
                              ind: ptr igraphvectorintt; cmp: proc (
    a0: ptr igraphvectort; a1: ptr igraphvectort): cint {.cdecl.}): igrapherrort {.
    cdecl, importc: "igraph_vector_list_sort_ind".}
proc igraphvectorintlistinit*(v: ptr igraphvectorintlistt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_init".}
proc igraphvectorintlistdestroy*(v: ptr igraphvectorintlistt): void {.cdecl,
    importc: "igraph_vector_int_list_destroy".}
proc igraphvectorintlistgetptr*(v: ptr igraphvectorintlistt; pos: igraphintegert): ptr igraphvectorintt {.
    cdecl, importc: "igraph_vector_int_list_get_ptr".}
proc igraphvectorintlistset*(v: ptr igraphvectorintlistt; pos: igraphintegert;
                             e: ptr igraphvectorintt): void {.cdecl,
    importc: "igraph_vector_int_list_set".}
proc igraphvectorintlisttailptr*(v: ptr igraphvectorintlistt): ptr igraphvectorintt {.
    cdecl, importc: "igraph_vector_int_list_tail_ptr".}
proc igraphvectorintlistcapacity*(v: ptr igraphvectorintlistt): igraphintegert {.
    cdecl, importc: "igraph_vector_int_list_capacity".}
proc igraphvectorintlistempty*(v: ptr igraphvectorintlistt): igraphboolt {.
    cdecl, importc: "igraph_vector_int_list_empty".}
proc igraphvectorintlistsize*(v: ptr igraphvectorintlistt): igraphintegert {.
    cdecl, importc: "igraph_vector_int_list_size".}
proc igraphvectorintlistclear*(v: ptr igraphvectorintlistt): void {.cdecl,
    importc: "igraph_vector_int_list_clear".}
proc igraphvectorintlistreserve*(v: ptr igraphvectorintlistt;
                                 capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_reserve".}
proc igraphvectorintlistresize*(v: ptr igraphvectorintlistt;
                                newsize: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_int_list_resize".}
proc igraphvectorintlistdiscard*(v: ptr igraphvectorintlistt;
                                 index: igraphintegert): void {.cdecl,
    importc: "igraph_vector_int_list_discard".}
proc igraphvectorintlistdiscardback*(v: ptr igraphvectorintlistt): void {.cdecl,
    importc: "igraph_vector_int_list_discard_back".}
proc igraphvectorintlistdiscardfast*(v: ptr igraphvectorintlistt;
                                     index: igraphintegert): void {.cdecl,
    importc: "igraph_vector_int_list_discard_fast".}
proc igraphvectorintlistinsert*(v: ptr igraphvectorintlistt;
                                pos: igraphintegert; e: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_insert".}
proc igraphvectorintlistinsertcopy*(v: ptr igraphvectorintlistt;
                                    pos: igraphintegert; e: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_insert_copy".}
proc igraphvectorintlistinsertnew*(v: ptr igraphvectorintlistt;
                                   pos: igraphintegert;
                                   result: ptr ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_insert_new".}
proc igraphvectorintlistpushback*(v: ptr igraphvectorintlistt;
                                  e: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_push_back".}
proc igraphvectorintlistpushbackcopy*(v: ptr igraphvectorintlistt;
                                      e: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_push_back_copy".}
proc igraphvectorintlistpushbacknew*(v: ptr igraphvectorintlistt;
                                     result: ptr ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_push_back_new".}
proc igraphvectorintlistpopback*(v: ptr igraphvectorintlistt): igraphvectorintt {.
    cdecl, importc: "igraph_vector_int_list_pop_back".}
proc igraphvectorintlistremove*(v: ptr igraphvectorintlistt;
                                index: igraphintegert; e: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_remove".}
proc igraphvectorintlistremovefast*(v: ptr igraphvectorintlistt;
                                    index: igraphintegert;
                                    e: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_remove_fast".}
proc igraphvectorintlistreplace*(v: ptr igraphvectorintlistt;
                                 pos: igraphintegert; e: ptr igraphvectorintt): void {.
    cdecl, importc: "igraph_vector_int_list_replace".}
proc igraphvectorintlistremoveconsecutiveduplicates*(
    v: ptr igraphvectorintlistt; eq: proc (a0: ptr igraphvectorintt;
    a1: ptr igraphvectorintt): igraphboolt {.cdecl.}): void {.cdecl,
    importc: "igraph_vector_int_list_remove_consecutive_duplicates".}
proc igraphvectorintlistpermute*(v: ptr igraphvectorintlistt;
                                 index: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_permute".}
proc igraphvectorintlistreverse*(v: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_reverse".}
proc igraphvectorintlistswap*(v1: ptr igraphvectorintlistt;
                              v2: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_swap".}
proc igraphvectorintlistswapelements*(v: ptr igraphvectorintlistt;
                                      i: igraphintegert; j: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_swap_elements".}
proc igraphvectorintlistsort*(v: ptr igraphvectorintlistt; cmp: proc (
    a0: ptr igraphvectorintt; a1: ptr igraphvectorintt): cint {.cdecl.}): void {.
    cdecl, importc: "igraph_vector_int_list_sort".}
proc igraphvectorintlistsortind*(v: ptr igraphvectorintlistt;
                                 ind: ptr igraphvectorintt; cmp: proc (
    a0: ptr igraphvectorintt; a1: ptr igraphvectorintt): cint {.cdecl.}): igrapherrort {.
    cdecl, importc: "igraph_vector_int_list_sort_ind".}
proc igraphvectorptrinit*(v: ptr igraphvectorptrt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_ptr_init".}
proc igraphvectorptrinitarray*(v: ptr igraphvectorptrt; data: ptr pointer;
                               length: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vector_ptr_init_array".}
proc igraphvectorptrinitcopy*(to: ptr igraphvectorptrt;
                              fromarg: ptr igraphvectorptrt): igrapherrort {.
    cdecl, importc: "igraph_vector_ptr_init_copy".}
proc igraphvectorptrview*(v: ptr igraphvectorptrt; data: ptr pointer;
                          length: igraphintegert): ptr igraphvectorptrt {.cdecl,
    importc: "igraph_vector_ptr_view".}
proc igraphvectorptrdestroy*(v: ptr igraphvectorptrt): void {.cdecl,
    importc: "igraph_vector_ptr_destroy".}
proc igraphvectorptrfreeall*(v: ptr igraphvectorptrt): void {.cdecl,
    importc: "igraph_vector_ptr_free_all".}
proc igraphvectorptrdestroyall*(v: ptr igraphvectorptrt): void {.cdecl,
    importc: "igraph_vector_ptr_destroy_all".}
proc igraphvectorptrreserve*(v: ptr igraphvectorptrt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_ptr_reserve".}
proc igraphvectorptrempty*(v: ptr igraphvectorptrt): igraphboolt {.cdecl,
    importc: "igraph_vector_ptr_empty".}
proc igraphvectorptrsize*(v: ptr igraphvectorptrt): igraphintegert {.cdecl,
    importc: "igraph_vector_ptr_size".}
proc igraphvectorptrclear*(v: ptr igraphvectorptrt): void {.cdecl,
    importc: "igraph_vector_ptr_clear".}
proc igraphvectorptrnull*(v: ptr igraphvectorptrt): void {.cdecl,
    importc: "igraph_vector_ptr_null".}
proc igraphvectorptrpushback*(v: ptr igraphvectorptrt; e: pointer): igrapherrort {.
    cdecl, importc: "igraph_vector_ptr_push_back".}
proc igraphvectorptrappend*(to: ptr igraphvectorptrt;
                            fromarg: ptr igraphvectorptrt): igrapherrort {.
    cdecl, importc: "igraph_vector_ptr_append".}
proc igraphvectorptrpopback*(v: ptr igraphvectorptrt): pointer {.cdecl,
    importc: "igraph_vector_ptr_pop_back".}
proc igraphvectorptrinsert*(v: ptr igraphvectorptrt; pos: igraphintegert;
                            e: pointer): igrapherrort {.cdecl,
    importc: "igraph_vector_ptr_insert".}
proc igraphvectorptre*(v: ptr igraphvectorptrt; pos: igraphintegert): pointer {.
    cdecl, importc: "igraph_vector_ptr_e".}
proc igraphvectorptrget*(v: ptr igraphvectorptrt; pos: igraphintegert): pointer {.
    cdecl, importc: "igraph_vector_ptr_get".}
proc igraphvectorptrset*(v: ptr igraphvectorptrt; pos: igraphintegert;
                         value: pointer): void {.cdecl,
    importc: "igraph_vector_ptr_set".}
proc igraphvectorptrresize*(v: ptr igraphvectorptrt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vector_ptr_resize".}
proc igraphvectorptrcopyto*(v: ptr igraphvectorptrt; to: ptr pointer): void {.
    cdecl, importc: "igraph_vector_ptr_copy_to".}
proc igraphvectorptrpermute*(v: ptr igraphvectorptrt;
                             index: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vector_ptr_permute".}
proc igraphvectorptrremove*(v: ptr igraphvectorptrt; pos: igraphintegert): void {.
    cdecl, importc: "igraph_vector_ptr_remove".}
proc igraphvectorptrsort*(v: ptr igraphvectorptrt; compar: proc (a0: pointer;
    a1: pointer): cint {.cdecl.}): void {.cdecl,
    importc: "igraph_vector_ptr_sort".}
proc igraphvectorptrsortind*(v: ptr igraphvectorptrt;
                             inds: ptr igraphvectorintt; compar: proc (
    a0: pointer; a1: pointer): cint {.cdecl.}): igrapherrort {.cdecl,
    importc: "igraph_vector_ptr_sort_ind".}
proc igraphvectorptrgetitemdestructor*(v: ptr igraphvectorptrt): igraphfinallyfunct {.
    cdecl, importc: "igraph_vector_ptr_get_item_destructor".}
proc igraphvectorptrsetitemdestructor*(v: ptr igraphvectorptrt;
                                       funcarg: igraphfinallyfunct): igraphfinallyfunct {.
    cdecl, importc: "igraph_vector_ptr_set_item_destructor".}
proc igraphvectorptrcopy*(to: ptr igraphvectorptrt;
                          fromarg: ptr igraphvectorptrt): igrapherrort {.cdecl,
    importc: "igraph_vector_ptr_copy".}
proc igraphinvalidatecache*(graph: ptr igrapht): void {.cdecl,
    importc: "igraph_invalidate_cache".}
proc igrapharpackoptionsinit*(o: ptr igrapharpackoptionst): void {.cdecl,
    importc: "igraph_arpack_options_init".}
proc igrapharpackoptionsgetdefault*(): ptr igrapharpackoptionst {.cdecl,
    importc: "igraph_arpack_options_get_default".}
proc igrapharpackstorageinit*(s: ptr igrapharpackstoraget; maxn: igraphintegert;
                              maxncv: igraphintegert; maxldv: igraphintegert;
                              symm: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_arpack_storage_init".}
proc igrapharpackstoragedestroy*(s: ptr igrapharpackstoraget): void {.cdecl,
    importc: "igraph_arpack_storage_destroy".}
proc igrapharpackrssolve*(fun: igrapharpackfunctiont; extra: pointer;
                          options: ptr igrapharpackoptionst;
                          storage: ptr igrapharpackstoraget;
                          values: ptr igraphvectort; vectors: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_arpack_rssolve".}
proc igrapharpackrnsolve*(fun: igrapharpackfunctiont; extra: pointer;
                          options: ptr igrapharpackoptionst;
                          storage: ptr igrapharpackstoraget;
                          values: ptr igraphmatrixt; vectors: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_arpack_rnsolve".}
proc igrapharpackunpackcomplex*(vectors: ptr igraphmatrixt;
                                values: ptr igraphmatrixt; nev: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_arpack_unpack_complex".}
proc igraphsparsematinit*(A: ptr igraphsparsematt; rows: igraphintegert;
                          cols: igraphintegert; nzmax: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_init".}
proc igraphsparsematinitcopy*(to: ptr igraphsparsematt;
                              fromarg: ptr igraphsparsematt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_init_copy".}
proc igraphsparsematdestroy*(A: ptr igraphsparsematt): void {.cdecl,
    importc: "igraph_sparsemat_destroy".}
proc igraphsparsematrealloc*(A: ptr igraphsparsematt; nzmax: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_realloc".}
proc igraphsparsematiniteye*(A: ptr igraphsparsematt; n: igraphintegert;
                             nzmax: igraphintegert; value: igraphrealt;
                             compress: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_init_eye".}
proc igraphsparsematinitdiag*(A: ptr igraphsparsematt; nzmax: igraphintegert;
                              values: ptr igraphvectort; compress: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_init_diag".}
proc igraphsparsematnrow*(A: ptr igraphsparsematt): igraphintegert {.cdecl,
    importc: "igraph_sparsemat_nrow".}
proc igraphsparsematncol*(B: ptr igraphsparsematt): igraphintegert {.cdecl,
    importc: "igraph_sparsemat_ncol".}
proc igraphsparsemattype*(A: ptr igraphsparsematt): igraphsparsemattypet {.
    cdecl, importc: "igraph_sparsemat_type".}
proc igraphsparsematistriplet*(A: ptr igraphsparsematt): igraphboolt {.cdecl,
    importc: "igraph_sparsemat_is_triplet".}
proc igraphsparsematiscc*(A: ptr igraphsparsematt): igraphboolt {.cdecl,
    importc: "igraph_sparsemat_is_cc".}
proc igraphsparsematpermute*(A: ptr igraphsparsematt; p: ptr igraphvectorintt;
                             q: ptr igraphvectorintt; res: ptr igraphsparsematt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_permute".}
proc igraphsparsematget*(A: ptr igraphsparsematt; row: igraphintegert;
                         col: igraphintegert): igraphrealt {.cdecl,
    importc: "igraph_sparsemat_get".}
proc igraphsparsematindex*(A: ptr igraphsparsematt; p: ptr igraphvectorintt;
                           q: ptr igraphvectorintt; res: ptr igraphsparsematt;
                           constres: ptr igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_index".}
proc igraphsparsematentry*(A: ptr igraphsparsematt; row: igraphintegert;
                           col: igraphintegert; elem: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_entry".}
proc igraphsparsematcompress*(A: ptr igraphsparsematt; res: ptr igraphsparsematt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_compress".}
proc igraphsparsemattranspose*(A: ptr igraphsparsematt;
                               res: ptr igraphsparsematt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_transpose".}
proc igraphsparsematissymmetric*(A: ptr igraphsparsematt;
                                 result: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_is_symmetric".}
proc igraphsparsematdupl*(A: ptr igraphsparsematt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_dupl".}
proc igraphsparsematfkeep*(A: ptr igraphsparsematt; fkeep: proc (
    a0: igraphintegert; a1: igraphintegert; a2: igraphrealt; a3: pointer): igraphintegert {.
    cdecl.}; other: pointer): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_fkeep".}
proc igraphsparsematdropzeros*(A: ptr igraphsparsematt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_dropzeros".}
proc igraphsparsematdroptol*(A: ptr igraphsparsematt; tol: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_droptol".}
proc igraphsparsematmultiply*(A: ptr igraphsparsematt; B: ptr igraphsparsematt;
                              res: ptr igraphsparsematt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_multiply".}
proc igraphsparsematadd*(A: ptr igraphsparsematt; B: ptr igraphsparsematt;
                         alpha: igraphrealt; beta: igraphrealt;
                         res: ptr igraphsparsematt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_add".}
proc igraphsparsematgaxpy*(A: ptr igraphsparsematt; x: ptr igraphvectort;
                           res: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_gaxpy".}
proc igraphsparsematlsolve*(A: ptr igraphsparsematt; b: ptr igraphvectort;
                            res: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_lsolve".}
proc igraphsparsematltsolve*(A: ptr igraphsparsematt; b: ptr igraphvectort;
                             res: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_ltsolve".}
proc igraphsparsematusolve*(A: ptr igraphsparsematt; b: ptr igraphvectort;
                            res: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_usolve".}
proc igraphsparsematutsolve*(A: ptr igraphsparsematt; b: ptr igraphvectort;
                             res: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_utsolve".}
proc igraphsparsematcholsol*(A: ptr igraphsparsematt; b: ptr igraphvectort;
                             res: ptr igraphvectort; order: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_cholsol".}
proc igraphsparsematlusol*(A: ptr igraphsparsematt; b: ptr igraphvectort;
                           res: ptr igraphvectort; order: igraphintegert;
                           tol: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_lusol".}
proc igraphsparsematprint*(A: ptr igraphsparsematt; outstream: ptr File): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_print".}
proc igraphsparsemat*(graph: ptr igrapht; A: ptr igraphsparsematt;
                      directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat".}
proc igraphweightedsparsemat*(graph: ptr igrapht; A: ptr igraphsparsematt;
                              directed: igraphboolt; attr: cstring;
                              loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_weighted_sparsemat".}
proc igraphmatrixassparsemat*(res: ptr igraphsparsematt; mat: ptr igraphmatrixt;
                              tol: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_matrix_as_sparsemat".}
proc igraphsparsematasmatrix*(res: ptr igraphmatrixt;
                              spmat: ptr igraphsparsematt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_as_matrix".}
proc igraphsparsematarpackrssolve*(A: ptr igraphsparsematt;
                                   options: ptr igrapharpackoptionst;
                                   storage: ptr igrapharpackstoraget;
                                   values: ptr igraphvectort;
                                   vectors: ptr igraphmatrixt;
                                   solvemethod: igraphsparsematsolvet): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_arpack_rssolve".}
proc igraphsparsematarpackrnsolve*(A: ptr igraphsparsematt;
                                   options: ptr igrapharpackoptionst;
                                   storage: ptr igrapharpackstoraget;
                                   values: ptr igraphmatrixt;
                                   vectors: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_arpack_rnsolve".}
proc igraphsparsematlu*(A: ptr igraphsparsematt;
                        dis: ptr igraphsparsematsymbolict;
                        din: ptr igraphsparsematnumerict; tol: cdouble): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_lu".}
proc igraphsparsematqr*(A: ptr igraphsparsematt;
                        dis: ptr igraphsparsematsymbolict;
                        din: ptr igraphsparsematnumerict): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_qr".}
proc igraphsparsematluresol*(dis: ptr igraphsparsematsymbolict;
                             din: ptr igraphsparsematnumerict;
                             b: ptr igraphvectort; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_luresol".}
proc igraphsparsematqrresol*(dis: ptr igraphsparsematsymbolict;
                             din: ptr igraphsparsematnumerict;
                             b: ptr igraphvectort; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_qrresol".}
proc igraphsparsematsymbqr*(order: igraphintegert; A: ptr igraphsparsematt;
                            dis: ptr igraphsparsematsymbolict): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_symbqr".}
proc igraphsparsematsymblu*(order: igraphintegert; A: ptr igraphsparsematt;
                            dis: ptr igraphsparsematsymbolict): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_symblu".}
proc igraphsparsematsymbolicdestroy*(dis: ptr igraphsparsematsymbolict): void {.
    cdecl, importc: "igraph_sparsemat_symbolic_destroy".}
proc igraphsparsematnumericdestroy*(din: ptr igraphsparsematnumerict): void {.
    cdecl, importc: "igraph_sparsemat_numeric_destroy".}
proc igraphsparsematmax*(A: ptr igraphsparsematt): igraphrealt {.cdecl,
    importc: "igraph_sparsemat_max".}
proc igraphsparsematmin*(A: ptr igraphsparsematt): igraphrealt {.cdecl,
    importc: "igraph_sparsemat_min".}
proc igraphsparsematminmax*(A: ptr igraphsparsematt; min: ptr igraphrealt;
                            max: ptr igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_minmax".}
proc igraphsparsematcountnonzero*(A: ptr igraphsparsematt): igraphintegert {.
    cdecl, importc: "igraph_sparsemat_count_nonzero".}
proc igraphsparsematcountnonzerotol*(A: ptr igraphsparsematt; tol: igraphrealt): igraphintegert {.
    cdecl, importc: "igraph_sparsemat_count_nonzerotol".}
proc igraphsparsematrowsums*(A: ptr igraphsparsematt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_rowsums".}
proc igraphsparsematcolsums*(A: ptr igraphsparsematt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_colsums".}
proc igraphsparsematrowmins*(A: ptr igraphsparsematt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_rowmins".}
proc igraphsparsematcolmins*(A: ptr igraphsparsematt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_colmins".}
proc igraphsparsematrowmaxs*(A: ptr igraphsparsematt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_rowmaxs".}
proc igraphsparsematcolmaxs*(A: ptr igraphsparsematt; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_colmaxs".}
proc igraphsparsematwhichminrows*(A: ptr igraphsparsematt;
                                  res: ptr igraphvectort;
                                  pos: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_which_min_rows".}
proc igraphsparsematwhichmincols*(A: ptr igraphsparsematt;
                                  res: ptr igraphvectort;
                                  pos: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_which_min_cols".}
proc igraphsparsematscale*(A: ptr igraphsparsematt; by: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_scale".}
proc igraphsparsemataddrows*(A: ptr igraphsparsematt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_add_rows".}
proc igraphsparsemataddcols*(A: ptr igraphsparsematt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_add_cols".}
proc igraphsparsematresize*(A: ptr igraphsparsematt; nrow: igraphintegert;
                            ncol: igraphintegert; nzmax: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_resize".}
proc igraphsparsematnonzerostorage*(A: ptr igraphsparsematt): igraphintegert {.
    cdecl, importc: "igraph_sparsemat_nonzero_storage".}
proc igraphsparsematgetelements*(A: ptr igraphsparsematt;
                                 i: ptr igraphvectorintt;
                                 j: ptr igraphvectorintt; x: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_getelements".}
proc igraphsparsematgetelementssorted*(A: ptr igraphsparsematt;
                                       i: ptr igraphvectorintt;
                                       j: ptr igraphvectorintt;
                                       x: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_getelements_sorted".}
proc igraphsparsematscalerows*(A: ptr igraphsparsematt; fact: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_scale_rows".}
proc igraphsparsematscalecols*(A: ptr igraphsparsematt; fact: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_scale_cols".}
proc igraphsparsematmultiplybydense*(A: ptr igraphsparsematt;
                                     B: ptr igraphmatrixt;
                                     res: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_multiply_by_dense".}
proc igraphsparsematdensemultiply*(A: ptr igraphmatrixt;
                                   B: ptr igraphsparsematt;
                                   res: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_dense_multiply".}
proc igraphsparsematview*(A: ptr igraphsparsematt; nzmax: igraphintegert;
                          m: igraphintegert; n: igraphintegert;
                          p: ptr igraphintegert; i: ptr igraphintegert;
                          x: ptr igraphrealt; nz: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_view".}
proc igraphsparsematsort*(A: ptr igraphsparsematt; sorted: ptr igraphsparsematt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_sort".}
proc igraphsparsematnzmax*(A: ptr igraphsparsematt): igraphintegert {.cdecl,
    importc: "igraph_sparsemat_nzmax".}
proc igraphsparsematneg*(A: ptr igraphsparsematt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_neg".}
proc igraphsparsematnormalizecols*(sparsemat: ptr igraphsparsematt;
                                   allowzeros: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_normalize_cols".}
proc igraphsparsematnormalizerows*(sparsemat: ptr igraphsparsematt;
                                   allowzeros: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_normalize_rows".}
proc igraphsparsematiteratorinit*(it: ptr igraphsparsematiteratort;
                                  sparsemat: ptr igraphsparsematt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_iterator_init".}
proc igraphsparsematiteratorreset*(it: ptr igraphsparsematiteratort): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_iterator_reset".}
proc igraphsparsematiteratorend*(it: ptr igraphsparsematiteratort): igraphboolt {.
    cdecl, importc: "igraph_sparsemat_iterator_end".}
proc igraphsparsematiteratorrow*(it: ptr igraphsparsematiteratort): igraphintegert {.
    cdecl, importc: "igraph_sparsemat_iterator_row".}
proc igraphsparsematiteratorcol*(it: ptr igraphsparsematiteratort): igraphintegert {.
    cdecl, importc: "igraph_sparsemat_iterator_col".}
proc igraphsparsematiteratoridx*(it: ptr igraphsparsematiteratort): igraphintegert {.
    cdecl, importc: "igraph_sparsemat_iterator_idx".}
proc igraphsparsematiteratorget*(it: ptr igraphsparsematiteratort): igraphrealt {.
    cdecl, importc: "igraph_sparsemat_iterator_get".}
proc igraphsparsematiteratornext*(it: ptr igraphsparsematiteratort): igraphintegert {.
    cdecl, importc: "igraph_sparsemat_iterator_next".}
proc igraphsparsematcopy*(to: ptr igraphsparsematt;
                          fromarg: ptr igraphsparsematt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_copy".}
proc igraphsparsematdiag*(A: ptr igraphsparsematt; nzmax: igraphintegert;
                          values: ptr igraphvectort; compress: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_sparsemat_diag".}
proc igraphsparsemateye*(A: ptr igraphsparsematt; n: igraphintegert;
                         nzmax: igraphintegert; value: igraphrealt;
                         compress: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_sparsemat_eye".}
proc igraphqsort*(base: pointer; nel: csize_t; width: csize_t;
                  compar: proc (a0: pointer; a1: pointer): cint {.cdecl.}): void {.
    cdecl, importc: "igraph_qsort".}
proc igraphqsortr*(base: pointer; nel: csize_t; width: csize_t; thunk: pointer;
    compar: proc (a0: pointer; a1: pointer; a2: pointer): cint {.cdecl.}): void {.
    cdecl, importc: "igraph_qsort_r".}
proc igraphgraphlistinit*(v: ptr igraphgraphlistt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_graph_list_init".}
proc igraphgraphlistdestroy*(v: ptr igraphgraphlistt): void {.cdecl,
    importc: "igraph_graph_list_destroy".}
proc igraphgraphlistgetptr*(v: ptr igraphgraphlistt; pos: igraphintegert): ptr igrapht {.
    cdecl, importc: "igraph_graph_list_get_ptr".}
proc igraphgraphlistset*(v: ptr igraphgraphlistt; pos: igraphintegert;
                         e: ptr igrapht): void {.cdecl,
    importc: "igraph_graph_list_set".}
proc igraphgraphlisttailptr*(v: ptr igraphgraphlistt): ptr igrapht {.cdecl,
    importc: "igraph_graph_list_tail_ptr".}
proc igraphgraphlistcapacity*(v: ptr igraphgraphlistt): igraphintegert {.cdecl,
    importc: "igraph_graph_list_capacity".}
proc igraphgraphlistempty*(v: ptr igraphgraphlistt): igraphboolt {.cdecl,
    importc: "igraph_graph_list_empty".}
proc igraphgraphlistsize*(v: ptr igraphgraphlistt): igraphintegert {.cdecl,
    importc: "igraph_graph_list_size".}
proc igraphgraphlistclear*(v: ptr igraphgraphlistt): void {.cdecl,
    importc: "igraph_graph_list_clear".}
proc igraphgraphlistreserve*(v: ptr igraphgraphlistt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_graph_list_reserve".}
proc igraphgraphlistresize*(v: ptr igraphgraphlistt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_graph_list_resize".}
proc igraphgraphlistdiscard*(v: ptr igraphgraphlistt; index: igraphintegert): void {.
    cdecl, importc: "igraph_graph_list_discard".}
proc igraphgraphlistdiscardback*(v: ptr igraphgraphlistt): void {.cdecl,
    importc: "igraph_graph_list_discard_back".}
proc igraphgraphlistdiscardfast*(v: ptr igraphgraphlistt; index: igraphintegert): void {.
    cdecl, importc: "igraph_graph_list_discard_fast".}
proc igraphgraphlistinsert*(v: ptr igraphgraphlistt; pos: igraphintegert;
                            e: ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_graph_list_insert".}
proc igraphgraphlistinsertcopy*(v: ptr igraphgraphlistt; pos: igraphintegert;
                                e: ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_graph_list_insert_copy".}
proc igraphgraphlistinsertnew*(v: ptr igraphgraphlistt; pos: igraphintegert;
                               result: ptr ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_graph_list_insert_new".}
proc igraphgraphlistpushback*(v: ptr igraphgraphlistt; e: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_graph_list_push_back".}
proc igraphgraphlistpushbackcopy*(v: ptr igraphgraphlistt; e: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_graph_list_push_back_copy".}
proc igraphgraphlistpushbacknew*(v: ptr igraphgraphlistt;
                                 result: ptr ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_graph_list_push_back_new".}
proc igraphgraphlistpopback*(v: ptr igraphgraphlistt): igrapht {.cdecl,
    importc: "igraph_graph_list_pop_back".}
proc igraphgraphlistremove*(v: ptr igraphgraphlistt; index: igraphintegert;
                            e: ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_graph_list_remove".}
proc igraphgraphlistremovefast*(v: ptr igraphgraphlistt; index: igraphintegert;
                                e: ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_graph_list_remove_fast".}
proc igraphgraphlistreplace*(v: ptr igraphgraphlistt; pos: igraphintegert;
                             e: ptr igrapht): void {.cdecl,
    importc: "igraph_graph_list_replace".}
proc igraphgraphlistremoveconsecutiveduplicates*(v: ptr igraphgraphlistt;
    eq: proc (a0: ptr igrapht; a1: ptr igrapht): igraphboolt {.cdecl.}): void {.
    cdecl, importc: "igraph_graph_list_remove_consecutive_duplicates".}
proc igraphgraphlistpermute*(v: ptr igraphgraphlistt;
                             index: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_graph_list_permute".}
proc igraphgraphlistreverse*(v: ptr igraphgraphlistt): igrapherrort {.cdecl,
    importc: "igraph_graph_list_reverse".}
proc igraphgraphlistswap*(v1: ptr igraphgraphlistt; v2: ptr igraphgraphlistt): igrapherrort {.
    cdecl, importc: "igraph_graph_list_swap".}
proc igraphgraphlistswapelements*(v: ptr igraphgraphlistt; i: igraphintegert;
                                  j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_graph_list_swap_elements".}
proc igraphgraphlistsort*(v: ptr igraphgraphlistt; cmp: proc (a0: ptr igrapht;
    a1: ptr igrapht): cint {.cdecl.}): void {.cdecl,
    importc: "igraph_graph_list_sort".}
proc igraphgraphlistsortind*(v: ptr igraphgraphlistt; ind: ptr igraphvectorintt;
    cmp: proc (a0: ptr igrapht; a1: ptr igrapht): cint {.cdecl.}): igrapherrort {.
    cdecl, importc: "igraph_graph_list_sort_ind".}
proc igraphgraphlistsetdirected*(list: ptr igraphgraphlistt;
                                 directed: igraphboolt): void {.cdecl,
    importc: "igraph_graph_list_set_directed".}
proc igraphvsall*(vs: ptr igraphvst): igrapherrort {.cdecl,
    importc: "igraph_vs_all".}
proc igraphvssall*(): igraphvst {.cdecl, importc: "igraph_vss_all".}
proc igraphvsadj*(vs: ptr igraphvst; vid: igraphintegert; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_vs_adj".}
proc igraphvsnonadj*(vs: ptr igraphvst; vid: igraphintegert;
                     mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_vs_nonadj".}
proc igraphvsnone*(vs: ptr igraphvst): igrapherrort {.cdecl,
    importc: "igraph_vs_none".}
proc igraphvssnone*(): igraphvst {.cdecl, importc: "igraph_vss_none".}
proc igraphvs1*(vs: ptr igraphvst; vid: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vs_1".}
proc igraphvss1*(vid: igraphintegert): igraphvst {.cdecl,
    importc: "igraph_vss_1".}
proc igraphvsvector*(vs: ptr igraphvst; v: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vs_vector".}
proc igraphvssvector*(v: ptr igraphvectorintt): igraphvst {.cdecl,
    importc: "igraph_vss_vector".}
proc igraphvsvectorsmall*(vs: ptr igraphvst): igrapherrort {.cdecl, varargs,
    importc: "igraph_vs_vector_small".}
proc igraphvsvectorcopy*(vs: ptr igraphvst; v: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vs_vector_copy".}
proc igraphvsseq*(vs: ptr igraphvst; fromarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vs_seq".}
proc igraphvssseq*(fromarg: igraphintegert; to: igraphintegert): igraphvst {.
    cdecl, importc: "igraph_vss_seq".}
proc igraphvsrange*(vs: ptr igraphvst; start: igraphintegert;
                    endarg: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vs_range".}
proc igraphvssrange*(start: igraphintegert; endarg: igraphintegert): igraphvst {.
    cdecl, importc: "igraph_vss_range".}
proc igraphvsdestroy*(vs: ptr igraphvst): void {.cdecl,
    importc: "igraph_vs_destroy".}
proc igraphvsisall*(vs: ptr igraphvst): igraphboolt {.cdecl,
    importc: "igraph_vs_is_all".}
proc igraphvscopy*(dest: ptr igraphvst; src: ptr igraphvst): igrapherrort {.
    cdecl, importc: "igraph_vs_copy".}
proc igraphvsasvector*(graph: ptr igrapht; vs: igraphvst;
                       v: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_vs_as_vector".}
proc igraphvssize*(graph: ptr igrapht; vs: ptr igraphvst;
                   result: ptr igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_vs_size".}
proc igraphvstype*(vs: ptr igraphvst): igraphvstypet {.cdecl,
    importc: "igraph_vs_type".}
proc igraphvitcreate*(graph: ptr igrapht; vs: igraphvst; vit: ptr igraphvitt): igrapherrort {.
    cdecl, importc: "igraph_vit_create".}
proc igraphvitdestroy*(vit: ptr igraphvitt): void {.cdecl,
    importc: "igraph_vit_destroy".}
proc igraphvitasvector*(vit: ptr igraphvitt; v: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_vit_as_vector".}
proc igraphesall*(es: ptr igraphest; order: igraphedgeordertypet): igrapherrort {.
    cdecl, importc: "igraph_es_all".}
proc igraphessall*(order: igraphedgeordertypet): igraphest {.cdecl,
    importc: "igraph_ess_all".}
proc igraphesincident*(es: ptr igraphest; vid: igraphintegert;
                       mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_es_incident".}
proc igraphesnone*(es: ptr igraphest): igrapherrort {.cdecl,
    importc: "igraph_es_none".}
proc igraphessnone*(): igraphest {.cdecl, importc: "igraph_ess_none".}
proc igraphes1*(es: ptr igraphest; eid: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_es_1".}
proc igraphess1*(eid: igraphintegert): igraphest {.cdecl,
    importc: "igraph_ess_1".}
proc igraphesvector*(es: ptr igraphest; v: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_es_vector".}
proc igraphessvector*(v: ptr igraphvectorintt): igraphest {.cdecl,
    importc: "igraph_ess_vector".}
proc igraphesrange*(es: ptr igraphest; fromarg: igraphintegert;
                    to: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_es_range".}
proc igraphessrange*(fromarg: igraphintegert; to: igraphintegert): igraphest {.
    cdecl, importc: "igraph_ess_range".}
proc igraphesseq*(es: ptr igraphest; fromarg: igraphintegert; to: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_es_seq".}
proc igraphessseq*(fromarg: igraphintegert; to: igraphintegert): igraphest {.
    cdecl, importc: "igraph_ess_seq".}
proc igraphesvectorcopy*(es: ptr igraphest; v: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_es_vector_copy".}
proc igraphespairs*(es: ptr igraphest; v: ptr igraphvectorintt;
                    directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_es_pairs".}
proc igraphespairssmall*(es: ptr igraphest; directed: igraphboolt; first: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_es_pairs_small".}
proc igraphespath*(es: ptr igraphest; v: ptr igraphvectorintt;
                   directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_es_path".}
proc igraphespathsmall*(es: ptr igraphest; directed: igraphboolt; first: cint): igrapherrort {.
    cdecl, varargs, importc: "igraph_es_path_small".}
proc igraphesallbetween*(es: ptr igraphest; fromarg: igraphintegert;
                         to: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_es_all_between".}
proc igraphesdestroy*(es: ptr igraphest): void {.cdecl,
    importc: "igraph_es_destroy".}
proc igraphesisall*(es: ptr igraphest): igraphboolt {.cdecl,
    importc: "igraph_es_is_all".}
proc igraphescopy*(dest: ptr igraphest; src: ptr igraphest): igrapherrort {.
    cdecl, importc: "igraph_es_copy".}
proc igraphesasvector*(graph: ptr igrapht; es: igraphest;
                       v: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_es_as_vector".}
proc igraphessize*(graph: ptr igrapht; es: ptr igraphest;
                   result: ptr igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_es_size".}
proc igraphestype*(es: ptr igraphest): igraphestypet {.cdecl,
    importc: "igraph_es_type".}
proc igrapheitcreate*(graph: ptr igrapht; es: igraphest; eit: ptr igrapheitt): igrapherrort {.
    cdecl, importc: "igraph_eit_create".}
proc igrapheitdestroy*(eit: ptr igrapheitt): void {.cdecl,
    importc: "igraph_eit_destroy".}
proc igrapheitasvector*(eit: ptr igrapheitt; v: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_eit_as_vector".}
proc igraphempty*(graph: ptr igrapht; n: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_empty".}
proc igraphemptyattrs*(graph: ptr igrapht; n: igraphintegert;
                       directed: igraphboolt; attr: pointer): igrapherrort {.
    cdecl, importc: "igraph_empty_attrs".}
proc igraphdestroy*(graph: ptr igrapht): void {.cdecl, importc: "igraph_destroy".}
proc igraphcopy*(to: ptr igrapht; fromarg: ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_copy".}
proc igraphaddedges*(graph: ptr igrapht; edges: ptr igraphvectorintt;
                     attr: pointer): igrapherrort {.cdecl,
    importc: "igraph_add_edges".}
proc igraphaddvertices*(graph: ptr igrapht; nv: igraphintegert; attr: pointer): igrapherrort {.
    cdecl, importc: "igraph_add_vertices".}
proc igraphdeleteedges*(graph: ptr igrapht; edges: igraphest): igrapherrort {.
    cdecl, importc: "igraph_delete_edges".}
proc igraphdeletevertices*(graph: ptr igrapht; vertices: igraphvst): igrapherrort {.
    cdecl, importc: "igraph_delete_vertices".}
proc igraphdeleteverticesidx*(graph: ptr igrapht; vertices: igraphvst;
                              idx: ptr igraphvectorintt;
                              invidx: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_delete_vertices_idx".}
proc igraphvcount*(graph: ptr igrapht): igraphintegert {.cdecl,
    importc: "igraph_vcount".}
proc igraphecount*(graph: ptr igrapht): igraphintegert {.cdecl,
    importc: "igraph_ecount".}
proc igraphneighbors*(graph: ptr igrapht; neis: ptr igraphvectorintt;
                      vid: igraphintegert; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_neighbors".}
proc igraphisdirected*(graph: ptr igrapht): igraphboolt {.cdecl,
    importc: "igraph_is_directed".}
proc igraphdegree1*(graph: ptr igrapht; deg: ptr igraphintegert;
                    vid: igraphintegert; mode: igraphneimodet;
                    loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_degree_1".}
proc igraphdegree*(graph: ptr igrapht; res: ptr igraphvectorintt;
                   vids: igraphvst; mode: igraphneimodet; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_degree".}
proc igraphedge*(graph: ptr igrapht; eid: igraphintegert;
                 fromarg: ptr igraphintegert; to: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_edge".}
proc igraphedges*(graph: ptr igrapht; eids: igraphest;
                  edges: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_edges".}
proc igraphgeteid*(graph: ptr igrapht; eid: ptr igraphintegert;
                   fromarg: igraphintegert; to: igraphintegert;
                   directed: igraphboolt; error: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_get_eid".}
proc igraphgeteids*(graph: ptr igrapht; eids: ptr igraphvectorintt;
                    pairs: ptr igraphvectorintt; directed: igraphboolt;
                    error: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_get_eids".}
proc igraphgetalleidsbetween*(graph: ptr igrapht; eids: ptr igraphvectorintt;
                              source: igraphintegert; target: igraphintegert;
                              directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_get_all_eids_between".}
proc igraphincident*(graph: ptr igrapht; eids: ptr igraphvectorintt;
                     vid: igraphintegert; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_incident".}
proc igraphissamegraph*(graph1: ptr igrapht; igraph2: ptr igrapht;
                        res: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_same_graph".}
proc igraphipropertycachegetbool*(graph: ptr igrapht;
                                  prop: igraphcachedpropertyt): igraphboolt {.
    cdecl, importc: "igraph_i_property_cache_get_bool".}
proc igraphipropertycachehas*(graph: ptr igrapht; prop: igraphcachedpropertyt): igraphboolt {.
    cdecl, importc: "igraph_i_property_cache_has".}
proc igraphipropertycachesetbool*(graph: ptr igrapht;
                                  prop: igraphcachedpropertyt;
                                  value: igraphboolt): void {.cdecl,
    importc: "igraph_i_property_cache_set_bool".}
proc igraphipropertycachesetboolchecked*(graph: ptr igrapht;
    prop: igraphcachedpropertyt; value: igraphboolt): void {.cdecl,
    importc: "igraph_i_property_cache_set_bool_checked".}
proc igraphipropertycacheinvalidate*(graph: ptr igrapht;
                                     prop: igraphcachedpropertyt): void {.cdecl,
    importc: "igraph_i_property_cache_invalidate".}
proc igraphipropertycacheinvalidateall*(graph: ptr igrapht): void {.cdecl,
    importc: "igraph_i_property_cache_invalidate_all".}
proc igraphisgraphical*(outdegrees: ptr igraphvectorintt;
                        indegrees: ptr igraphvectorintt;
                        allowededgetypes: igraphedgetypeswt;
                        res: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_graphical".}
proc igraphisbigraphical*(degrees1: ptr igraphvectorintt;
                          degrees2: ptr igraphvectorintt;
                          allowededgetypes: igraphedgetypeswt;
                          res: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_bigraphical".}
proc igraphcreate*(graph: ptr igrapht; edges: ptr igraphvectorintt;
                   n: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_create".}
proc igraphsmall*(graph: ptr igrapht; n: igraphintegert; directed: igraphboolt;
                  first: cint): igrapherrort {.cdecl, varargs,
    importc: "igraph_small".}
proc igraphadjacency*(graph: ptr igrapht; adjmatrix: ptr igraphmatrixt;
                      mode: igraphadjacencyt; loops: igraphloopst): igrapherrort {.
    cdecl, importc: "igraph_adjacency".}
proc igraphweightedadjacency*(graph: ptr igrapht; adjmatrix: ptr igraphmatrixt;
                              mode: igraphadjacencyt;
                              weights: ptr igraphvectort; loops: igraphloopst): igrapherrort {.
    cdecl, importc: "igraph_weighted_adjacency".}
proc igraphsparseadjacency*(graph: ptr igrapht; adjmatrix: ptr igraphsparsematt;
                            mode: igraphadjacencyt; loops: igraphloopst): igrapherrort {.
    cdecl, importc: "igraph_sparse_adjacency".}
proc igraphsparseweightedadjacency*(graph: ptr igrapht;
                                    adjmatrix: ptr igraphsparsematt;
                                    mode: igraphadjacencyt;
                                    weights: ptr igraphvectort;
                                    loops: igraphloopst): igrapherrort {.cdecl,
    importc: "igraph_sparse_weighted_adjacency".}
proc igraphstar*(graph: ptr igrapht; n: igraphintegert; mode: igraphstarmodet;
                 center: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_star".}
proc igraphwheel*(graph: ptr igrapht; n: igraphintegert; mode: igraphwheelmodet;
                  center: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_wheel".}
proc igraphlattice*(graph: ptr igrapht; dimvector: ptr igraphvectorintt;
                    nei: igraphintegert; directed: igraphboolt;
                    mutual: igraphboolt; circular: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_lattice".}
proc igraphsquarelattice*(graph: ptr igrapht; dimvector: ptr igraphvectorintt;
                          nei: igraphintegert; directed: igraphboolt;
                          mutual: igraphboolt; circular: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_square_lattice".}
proc igraphring*(graph: ptr igrapht; n: igraphintegert; directed: igraphboolt;
                 mutual: igraphboolt; circular: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_ring".}
proc igraphtree*(graph: ptr igrapht; n: igraphintegert;
                 children: igraphintegert; typearg: igraphtreemodet): igrapherrort {.
    cdecl, importc: "igraph_tree".}
proc igraphkarytree*(graph: ptr igrapht; n: igraphintegert;
                     children: igraphintegert; typearg: igraphtreemodet): igrapherrort {.
    cdecl, importc: "igraph_kary_tree".}
proc igraphsymmetrictree*(graph: ptr igrapht; branches: ptr igraphvectorintt;
                          typearg: igraphtreemodet): igrapherrort {.cdecl,
    importc: "igraph_symmetric_tree".}
proc igraphregulartree*(graph: ptr igrapht; h: igraphintegert;
                        k: igraphintegert; typearg: igraphtreemodet): igrapherrort {.
    cdecl, importc: "igraph_regular_tree".}
proc igraphtreefromparentvector*(graph: ptr igrapht;
                                 parents: ptr igraphvectorintt;
                                 mode: igraphtreemodet): igrapherrort {.cdecl,
    importc: "igraph_tree_from_parent_vector".}
proc igraphfromprufer*(graph: ptr igrapht; prufer: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_from_prufer".}
proc igraphfull*(graph: ptr igrapht; n: igraphintegert; directed: igraphboolt;
                 loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_full".}
proc igraphfullmultipartite*(graph: ptr igrapht; types: ptr igraphvectorintt;
                             n: ptr igraphvectorintt; directed: igraphboolt;
                             mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_full_multipartite".}
proc igraphturan*(graph: ptr igrapht; types: ptr igraphvectorintt;
                  n: igraphintegert; r: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_turan".}
proc igraphfullcitation*(graph: ptr igrapht; n: igraphintegert;
                         directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_full_citation".}
proc igraphatlas*(graph: ptr igrapht; number: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_atlas".}
proc igraphextendedchordalring*(graph: ptr igrapht; nodes: igraphintegert;
                                W: ptr igraphmatrixintt; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_extended_chordal_ring".}
proc igraphlinegraph*(graph: ptr igrapht; linegraph: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_linegraph".}
proc igraphdebruijn*(graph: ptr igrapht; m: igraphintegert; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_de_bruijn".}
proc igraphcirculant*(graph: ptr igrapht; n: igraphintegert;
                      l: ptr igraphvectorintt; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_circulant".}
proc igraphgeneralizedpetersen*(graph: ptr igrapht; n: igraphintegert;
                                k: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_generalized_petersen".}
proc igraphkautz*(graph: ptr igrapht; m: igraphintegert; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_kautz".}
proc igraphfamous*(graph: ptr igrapht; name: cstring): igrapherrort {.cdecl,
    importc: "igraph_famous".}
proc igraphlcfvector*(graph: ptr igrapht; n: igraphintegert;
                      shifts: ptr igraphvectorintt; repeats: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_lcf_vector".}
proc igraphlcf*(graph: ptr igrapht; n: igraphintegert): igrapherrort {.cdecl,
    varargs, importc: "igraph_lcf".}
proc igraphrealizedegreesequence*(graph: ptr igrapht;
                                  outdeg: ptr igraphvectorintt;
                                  indeg: ptr igraphvectorintt;
                                  allowededgetypes: igraphedgetypeswt;
                                  methodarg: igraphrealizedegseqt): igrapherrort {.
    cdecl, importc: "igraph_realize_degree_sequence".}
proc igraphtriangularlattice*(graph: ptr igrapht; dims: ptr igraphvectorintt;
                              directed: igraphboolt; mutual: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_triangular_lattice".}
proc igraphhexagonallattice*(graph: ptr igrapht; dims: ptr igraphvectorintt;
                             directed: igraphboolt; mutual: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_hexagonal_lattice".}
proc igraphrealizebipartitedegreesequence*(graph: ptr igrapht;
    deg1: ptr igraphvectorintt; deg2: ptr igraphvectorintt;
    allowededgetypes: igraphedgetypeswt; methodarg: igraphrealizedegseqt): igrapherrort {.
    cdecl, importc: "igraph_realize_bipartite_degree_sequence".}
proc igraphmatrixlistinit*(v: ptr igraphmatrixlistt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_init".}
proc igraphmatrixlistdestroy*(v: ptr igraphmatrixlistt): void {.cdecl,
    importc: "igraph_matrix_list_destroy".}
proc igraphmatrixlistgetptr*(v: ptr igraphmatrixlistt; pos: igraphintegert): ptr igraphmatrixt {.
    cdecl, importc: "igraph_matrix_list_get_ptr".}
proc igraphmatrixlistset*(v: ptr igraphmatrixlistt; pos: igraphintegert;
                          e: ptr igraphmatrixt): void {.cdecl,
    importc: "igraph_matrix_list_set".}
proc igraphmatrixlisttailptr*(v: ptr igraphmatrixlistt): ptr igraphmatrixt {.
    cdecl, importc: "igraph_matrix_list_tail_ptr".}
proc igraphmatrixlistcapacity*(v: ptr igraphmatrixlistt): igraphintegert {.
    cdecl, importc: "igraph_matrix_list_capacity".}
proc igraphmatrixlistempty*(v: ptr igraphmatrixlistt): igraphboolt {.cdecl,
    importc: "igraph_matrix_list_empty".}
proc igraphmatrixlistsize*(v: ptr igraphmatrixlistt): igraphintegert {.cdecl,
    importc: "igraph_matrix_list_size".}
proc igraphmatrixlistclear*(v: ptr igraphmatrixlistt): void {.cdecl,
    importc: "igraph_matrix_list_clear".}
proc igraphmatrixlistreserve*(v: ptr igraphmatrixlistt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_reserve".}
proc igraphmatrixlistresize*(v: ptr igraphmatrixlistt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_resize".}
proc igraphmatrixlistdiscard*(v: ptr igraphmatrixlistt; index: igraphintegert): void {.
    cdecl, importc: "igraph_matrix_list_discard".}
proc igraphmatrixlistdiscardback*(v: ptr igraphmatrixlistt): void {.cdecl,
    importc: "igraph_matrix_list_discard_back".}
proc igraphmatrixlistdiscardfast*(v: ptr igraphmatrixlistt;
                                  index: igraphintegert): void {.cdecl,
    importc: "igraph_matrix_list_discard_fast".}
proc igraphmatrixlistinsert*(v: ptr igraphmatrixlistt; pos: igraphintegert;
                             e: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_list_insert".}
proc igraphmatrixlistinsertcopy*(v: ptr igraphmatrixlistt; pos: igraphintegert;
                                 e: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_list_insert_copy".}
proc igraphmatrixlistinsertnew*(v: ptr igraphmatrixlistt; pos: igraphintegert;
                                result: ptr ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_insert_new".}
proc igraphmatrixlistpushback*(v: ptr igraphmatrixlistt; e: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_push_back".}
proc igraphmatrixlistpushbackcopy*(v: ptr igraphmatrixlistt;
                                   e: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_list_push_back_copy".}
proc igraphmatrixlistpushbacknew*(v: ptr igraphmatrixlistt;
                                  result: ptr ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_push_back_new".}
proc igraphmatrixlistpopback*(v: ptr igraphmatrixlistt): igraphmatrixt {.cdecl,
    importc: "igraph_matrix_list_pop_back".}
proc igraphmatrixlistremove*(v: ptr igraphmatrixlistt; index: igraphintegert;
                             e: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_matrix_list_remove".}
proc igraphmatrixlistremovefast*(v: ptr igraphmatrixlistt;
                                 index: igraphintegert; e: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_remove_fast".}
proc igraphmatrixlistreplace*(v: ptr igraphmatrixlistt; pos: igraphintegert;
                              e: ptr igraphmatrixt): void {.cdecl,
    importc: "igraph_matrix_list_replace".}
proc igraphmatrixlistremoveconsecutiveduplicates*(v: ptr igraphmatrixlistt; eq: proc (
    a0: ptr igraphmatrixt; a1: ptr igraphmatrixt): igraphboolt {.cdecl.}): void {.
    cdecl, importc: "igraph_matrix_list_remove_consecutive_duplicates".}
proc igraphmatrixlistpermute*(v: ptr igraphmatrixlistt;
                              index: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_permute".}
proc igraphmatrixlistreverse*(v: ptr igraphmatrixlistt): igrapherrort {.cdecl,
    importc: "igraph_matrix_list_reverse".}
proc igraphmatrixlistswap*(v1: ptr igraphmatrixlistt; v2: ptr igraphmatrixlistt): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_swap".}
proc igraphmatrixlistswapelements*(v: ptr igraphmatrixlistt; i: igraphintegert;
                                   j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_matrix_list_swap_elements".}
proc igraphmatrixlistsort*(v: ptr igraphmatrixlistt; cmp: proc (
    a0: ptr igraphmatrixt; a1: ptr igraphmatrixt): cint {.cdecl.}): void {.
    cdecl, importc: "igraph_matrix_list_sort".}
proc igraphmatrixlistsortind*(v: ptr igraphmatrixlistt;
                              ind: ptr igraphvectorintt; cmp: proc (
    a0: ptr igraphmatrixt; a1: ptr igraphmatrixt): cint {.cdecl.}): igrapherrort {.
    cdecl, importc: "igraph_matrix_list_sort_ind".}
proc igraphbarabasigame*(graph: ptr igrapht; n: igraphintegert;
                         power: igraphrealt; m: igraphintegert;
                         outseq: ptr igraphvectorintt; outpref: igraphboolt;
                         A: igraphrealt; directed: igraphboolt;
                         algo: igraphbarabasialgorithmt; startfrom: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_barabasi_game".}
proc igrapherdosrenyigamegnp*(graph: ptr igrapht; n: igraphintegert;
                              p: igraphrealt; directed: igraphboolt;
                              loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_erdos_renyi_game_gnp".}
proc igrapherdosrenyigamegnm*(graph: ptr igrapht; n: igraphintegert;
                              m: igraphintegert; directed: igraphboolt;
                              loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_erdos_renyi_game_gnm".}
proc igraphdegreesequencegame*(graph: ptr igrapht; outdeg: ptr igraphvectorintt;
                               indeg: ptr igraphvectorintt;
                               methodarg: igraphdegseqt): igrapherrort {.cdecl,
    importc: "igraph_degree_sequence_game".}
proc igraphgrowingrandomgame*(graph: ptr igrapht; n: igraphintegert;
                              m: igraphintegert; directed: igraphboolt;
                              citation: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_growing_random_game".}
proc igraphbarabasiaginggame*(graph: ptr igrapht; nodes: igraphintegert;
                              m: igraphintegert; outseq: ptr igraphvectorintt;
                              outpref: igraphboolt; paexp: igraphrealt;
                              agingexp: igraphrealt; agingbin: igraphintegert;
                              zerodegappeal: igraphrealt;
                              zeroageappeal: igraphrealt; degcoef: igraphrealt;
                              agecoef: igraphrealt; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_barabasi_aging_game".}
proc igraphrecentdegreegame*(graph: ptr igrapht; n: igraphintegert;
                             power: igraphrealt; window: igraphintegert;
                             m: igraphintegert; outseq: ptr igraphvectorintt;
                             outpref: igraphboolt; zeroappeal: igraphrealt;
                             directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_recent_degree_game".}
proc igraphrecentdegreeaginggame*(graph: ptr igrapht; nodes: igraphintegert;
                                  m: igraphintegert;
                                  outseq: ptr igraphvectorintt;
                                  outpref: igraphboolt; paexp: igraphrealt;
                                  agingexp: igraphrealt;
                                  agingbin: igraphintegert;
                                  window: igraphintegert;
                                  zeroappeal: igraphrealt; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_recent_degree_aging_game".}
proc igraphcallawaytraitsgame*(graph: ptr igrapht; nodes: igraphintegert;
                               types: igraphintegert;
                               edgesperstep: igraphintegert;
                               typedist: ptr igraphvectort;
                               prefmatrix: ptr igraphmatrixt;
                               directed: igraphboolt;
                               nodetypevec: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_callaway_traits_game".}
proc igraphestablishmentgame*(graph: ptr igrapht; nodes: igraphintegert;
                              types: igraphintegert; k: igraphintegert;
                              typedist: ptr igraphvectort;
                              prefmatrix: ptr igraphmatrixt;
                              directed: igraphboolt;
                              nodetypevec: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_establishment_game".}
proc igraphgrggame*(graph: ptr igrapht; nodes: igraphintegert;
                    radius: igraphrealt; torus: igraphboolt;
                    x: ptr igraphvectort; y: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_grg_game".}
proc igraphpreferencegame*(graph: ptr igrapht; nodes: igraphintegert;
                           types: igraphintegert; typedist: ptr igraphvectort;
                           fixedsizes: igraphboolt;
                           prefmatrix: ptr igraphmatrixt;
                           nodetypevec: ptr igraphvectorintt;
                           directed: igraphboolt; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_preference_game".}
proc igraphasymmetricpreferencegame*(graph: ptr igrapht; nodes: igraphintegert;
                                     outtypes: igraphintegert;
                                     intypes: igraphintegert;
                                     typedistmatrix: ptr igraphmatrixt;
                                     prefmatrix: ptr igraphmatrixt;
                                     nodetypeoutvec: ptr igraphvectorintt;
                                     nodetypeinvec: ptr igraphvectorintt;
                                     loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_asymmetric_preference_game".}
proc igraphrewireedges*(graph: ptr igrapht; prob: igraphrealt;
                        loops: igraphboolt; multiple: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_rewire_edges".}
proc igraphrewiredirectededges*(graph: ptr igrapht; prob: igraphrealt;
                                loops: igraphboolt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_rewire_directed_edges".}
proc igraphwattsstrogatzgame*(graph: ptr igrapht; dim: igraphintegert;
                              size: igraphintegert; nei: igraphintegert;
                              p: igraphrealt; loops: igraphboolt;
                              multiple: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_watts_strogatz_game".}
proc igraphlastcitgame*(graph: ptr igrapht; nodes: igraphintegert;
                        edgespernode: igraphintegert; agebins: igraphintegert;
                        preference: ptr igraphvectort; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_lastcit_game".}
proc igraphcitedtypegame*(graph: ptr igrapht; nodes: igraphintegert;
                          types: ptr igraphvectorintt; pref: ptr igraphvectort;
                          edgesperstep: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_cited_type_game".}
proc igraphcitingcitedtypegame*(graph: ptr igrapht; nodes: igraphintegert;
                                types: ptr igraphvectorintt;
                                pref: ptr igraphmatrixt;
                                edgesperstep: igraphintegert;
                                directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_citing_cited_type_game".}
proc igraphforestfiregame*(graph: ptr igrapht; nodes: igraphintegert;
                           fwprob: igraphrealt; bwfactor: igraphrealt;
                           ambs: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_forest_fire_game".}
proc igraphsimpleinterconnectedislandsgame*(graph: ptr igrapht;
    islandsn: igraphintegert; islandssize: igraphintegert;
    islandspin: igraphrealt; ninter: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_simple_interconnected_islands_game".}
proc igraphstaticfitnessgame*(graph: ptr igrapht; noofedges: igraphintegert;
                              fitnessout: ptr igraphvectort;
                              fitnessin: ptr igraphvectort; loops: igraphboolt;
                              multiple: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_static_fitness_game".}
proc igraphstaticpowerlawgame*(graph: ptr igrapht; noofnodes: igraphintegert;
                               noofedges: igraphintegert;
                               exponentout: igraphrealt;
                               exponentin: igraphrealt; loops: igraphboolt;
                               multiple: igraphboolt;
                               finitesizecorrection: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_static_power_law_game".}
proc igraphkregulargame*(graph: ptr igrapht; noofnodes: igraphintegert;
                         k: igraphintegert; directed: igraphboolt;
                         multiple: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_k_regular_game".}
proc igraphsbmgame*(graph: ptr igrapht; n: igraphintegert;
                    prefmatrix: ptr igraphmatrixt;
                    blocksizes: ptr igraphvectorintt; directed: igraphboolt;
                    loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_sbm_game".}
proc igraphhsbmgame*(graph: ptr igrapht; n: igraphintegert; m: igraphintegert;
                     rho: ptr igraphvectort; C: ptr igraphmatrixt;
                     p: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_hsbm_game".}
proc igraphhsbmlistgame*(graph: ptr igrapht; n: igraphintegert;
                         mlist: ptr igraphvectorintt;
                         rholist: ptr igraphvectorlistt;
                         Clist: ptr igraphmatrixlistt; p: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_hsbm_list_game".}
proc igraphcorrelatedgame*(oldgraph: ptr igrapht; newgraph: ptr igrapht;
                           corr: igraphrealt; p: igraphrealt;
                           permutation: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_correlated_game".}
proc igraphcorrelatedpairgame*(graph1: ptr igrapht; graph2: ptr igrapht;
                               n: igraphintegert; corr: igraphrealt;
                               p: igraphrealt; directed: igraphboolt;
                               permutation: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_correlated_pair_game".}
proc igraphtreegame*(graph: ptr igrapht; n: igraphintegert;
                     directed: igraphboolt; methodarg: igraphrandomtreet): igrapherrort {.
    cdecl, importc: "igraph_tree_game".}
proc igraphdotproductgame*(graph: ptr igrapht; vecs: ptr igraphmatrixt;
                           directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_dot_product_game".}
proc igraphsamplespheresurface*(dim: igraphintegert; n: igraphintegert;
                                radius: igraphrealt; positive: igraphboolt;
                                res: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_sample_sphere_surface".}
proc igraphsamplespherevolume*(dim: igraphintegert; n: igraphintegert;
                               radius: igraphrealt; positive: igraphboolt;
                               res: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_sample_sphere_volume".}
proc igraphsampledirichlet*(n: igraphintegert; alpha: ptr igraphvectort;
                            res: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_sample_dirichlet".}
proc igrapherdosrenyigame*(graph: ptr igrapht; typearg: igrapherdosrenyit;
                           n: igraphintegert; porm: igraphrealt;
                           directed: igraphboolt; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_erdos_renyi_game".}
proc igraphdeterministicoptimalimitation*(graph: ptr igrapht;
    vid: igraphintegert; optimality: igraphoptimalt;
    quantities: ptr igraphvectort; strategies: ptr igraphvectorintt;
    mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_deterministic_optimal_imitation".}
proc igraphmoranprocess*(graph: ptr igrapht; weights: ptr igraphvectort;
                         quantities: ptr igraphvectort;
                         strategies: ptr igraphvectorintt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_moran_process".}
proc igraphroulettewheelimitation*(graph: ptr igrapht; vid: igraphintegert;
                                   islocal: igraphboolt;
                                   quantities: ptr igraphvectort;
                                   strategies: ptr igraphvectorintt;
                                   mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_roulette_wheel_imitation".}
proc igraphstochasticimitation*(graph: ptr igrapht; vid: igraphintegert;
                                algo: igraphimitatealgorithmt;
                                quantities: ptr igraphvectort;
                                strategies: ptr igraphvectorintt;
                                mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_stochastic_imitation".}
proc igraphcloseness*(graph: ptr igrapht; res: ptr igraphvectort;
                      reachablecount: ptr igraphvectorintt;
                      allreachable: ptr igraphboolt; vids: igraphvst;
                      mode: igraphneimodet; weights: ptr igraphvectort;
                      normalized: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_closeness".}
proc igraphclosenesscutoff*(graph: ptr igrapht; res: ptr igraphvectort;
                            reachablecount: ptr igraphvectorintt;
                            allreachable: ptr igraphboolt; vids: igraphvst;
                            mode: igraphneimodet; weights: ptr igraphvectort;
                            normalized: igraphboolt; cutoff: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_closeness_cutoff".}
proc igraphharmoniccentrality*(graph: ptr igrapht; res: ptr igraphvectort;
                               vids: igraphvst; mode: igraphneimodet;
                               weights: ptr igraphvectort;
                               normalized: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_harmonic_centrality".}
proc igraphharmoniccentralitycutoff*(graph: ptr igrapht; res: ptr igraphvectort;
                                     vids: igraphvst; mode: igraphneimodet;
                                     weights: ptr igraphvectort;
                                     normalized: igraphboolt;
                                     cutoff: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_harmonic_centrality_cutoff".}
proc igraphbetweenness*(graph: ptr igrapht; res: ptr igraphvectort;
                        vids: igraphvst; directed: igraphboolt;
                        weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_betweenness".}
proc igraphbetweennesscutoff*(graph: ptr igrapht; res: ptr igraphvectort;
                              vids: igraphvst; directed: igraphboolt;
                              weights: ptr igraphvectort; cutoff: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_betweenness_cutoff".}
proc igraphedgebetweenness*(graph: ptr igrapht; result: ptr igraphvectort;
                            directed: igraphboolt; weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_edge_betweenness".}
proc igraphedgebetweennesscutoff*(graph: ptr igrapht; result: ptr igraphvectort;
                                  directed: igraphboolt;
                                  weights: ptr igraphvectort;
                                  cutoff: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_edge_betweenness_cutoff".}
proc igraphbetweennesssubset*(graph: ptr igrapht; res: ptr igraphvectort;
                              vids: igraphvst; directed: igraphboolt;
                              sources: igraphvst; targets: igraphvst;
                              weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_betweenness_subset".}
proc igraphedgebetweennesssubset*(graph: ptr igrapht; res: ptr igraphvectort;
                                  eids: igraphest; directed: igraphboolt;
                                  sources: igraphvst; targets: igraphvst;
                                  weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_edge_betweenness_subset".}
proc igraphpagerank*(graph: ptr igrapht; algo: igraphpagerankalgot;
                     vector: ptr igraphvectort; value: ptr igraphrealt;
                     vids: igraphvst; directed: igraphboolt;
                     damping: igraphrealt; weights: ptr igraphvectort;
                     options: ptr igrapharpackoptionst): igrapherrort {.cdecl,
    importc: "igraph_pagerank".}
proc igraphpersonalizedpagerank*(graph: ptr igrapht; algo: igraphpagerankalgot;
                                 vector: ptr igraphvectort;
                                 value: ptr igraphrealt; vids: igraphvst;
                                 directed: igraphboolt; damping: igraphrealt;
                                 reset: ptr igraphvectort;
                                 weights: ptr igraphvectort;
                                 options: ptr igrapharpackoptionst): igrapherrort {.
    cdecl, importc: "igraph_personalized_pagerank".}
proc igraphpersonalizedpagerankvs*(graph: ptr igrapht;
                                   algo: igraphpagerankalgot;
                                   vector: ptr igraphvectort;
                                   value: ptr igraphrealt; vids: igraphvst;
                                   directed: igraphboolt; damping: igraphrealt;
                                   resetvids: igraphvst;
                                   weights: ptr igraphvectort;
                                   options: ptr igrapharpackoptionst): igrapherrort {.
    cdecl, importc: "igraph_personalized_pagerank_vs".}
proc igrapheigenvectorcentrality*(graph: ptr igrapht; vector: ptr igraphvectort;
                                  value: ptr igraphrealt; directed: igraphboolt;
                                  scale: igraphboolt;
                                  weights: ptr igraphvectort;
                                  options: ptr igrapharpackoptionst): igrapherrort {.
    cdecl, importc: "igraph_eigenvector_centrality".}
proc igraphhubandauthorityscores*(graph: ptr igrapht;
                                  hubvector: ptr igraphvectort;
                                  authorityvector: ptr igraphvectort;
                                  value: ptr igraphrealt; scale: igraphboolt;
                                  weights: ptr igraphvectort;
                                  options: ptr igrapharpackoptionst): igrapherrort {.
    cdecl, importc: "igraph_hub_and_authority_scores".}
proc igraphconstraint*(graph: ptr igrapht; res: ptr igraphvectort;
                       vids: igraphvst; weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_constraint".}
proc igraphconvergencedegree*(graph: ptr igrapht; result: ptr igraphvectort;
                              ins: ptr igraphvectort; outs: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_convergence_degree".}
proc igraphcentralization*(scores: ptr igraphvectort;
                           theoreticalmax: igraphrealt; normalized: igraphboolt): igraphrealt {.
    cdecl, importc: "igraph_centralization".}
proc igraphcentralizationdegree*(graph: ptr igrapht; res: ptr igraphvectort;
                                 mode: igraphneimodet; loops: igraphboolt;
                                 centralization: ptr igraphrealt;
                                 theoreticalmax: ptr igraphrealt;
                                 normalized: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_centralization_degree".}
proc igraphcentralizationdegreetmax*(graph: ptr igrapht; nodes: igraphintegert;
                                     mode: igraphneimodet; loops: igraphboolt;
                                     res: ptr igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_centralization_degree_tmax".}
proc igraphcentralizationbetweenness*(graph: ptr igrapht;
                                      res: ptr igraphvectort;
                                      directed: igraphboolt;
                                      centralization: ptr igraphrealt;
                                      theoreticalmax: ptr igraphrealt;
                                      normalized: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_centralization_betweenness".}
proc igraphcentralizationbetweennesstmax*(graph: ptr igrapht;
    nodes: igraphintegert; directed: igraphboolt; res: ptr igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_centralization_betweenness_tmax".}
proc igraphcentralizationcloseness*(graph: ptr igrapht; res: ptr igraphvectort;
                                    mode: igraphneimodet;
                                    centralization: ptr igraphrealt;
                                    theoreticalmax: ptr igraphrealt;
                                    normalized: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_centralization_closeness".}
proc igraphcentralizationclosenesstmax*(graph: ptr igrapht;
                                        nodes: igraphintegert;
                                        mode: igraphneimodet;
                                        res: ptr igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_centralization_closeness_tmax".}
proc igraphcentralizationeigenvectorcentrality*(graph: ptr igrapht;
    vector: ptr igraphvectort; value: ptr igraphrealt; directed: igraphboolt;
    scale: igraphboolt; options: ptr igrapharpackoptionst;
    centralization: ptr igraphrealt; theoreticalmax: ptr igraphrealt;
    normalized: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_centralization_eigenvector_centrality".}
proc igraphcentralizationeigenvectorcentralitytmax*(graph: ptr igrapht;
    nodes: igraphintegert; directed: igraphboolt; scale: igraphboolt;
    res: ptr igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_centralization_eigenvector_centrality_tmax".}
proc igraphhubscore*(graph: ptr igrapht; vector: ptr igraphvectort;
                     value: ptr igraphrealt; scale: igraphboolt;
                     weights: ptr igraphvectort;
                     options: ptr igrapharpackoptionst): igrapherrort {.cdecl,
    importc: "igraph_hub_score".}
proc igraphauthorityscore*(graph: ptr igrapht; vector: ptr igraphvectort;
                           value: ptr igraphrealt; scale: igraphboolt;
                           weights: ptr igraphvectort;
                           options: ptr igrapharpackoptionst): igrapherrort {.
    cdecl, importc: "igraph_authority_score".}
proc igraphdiameter*(graph: ptr igrapht; res: ptr igraphrealt;
                     fromarg: ptr igraphintegert; to: ptr igraphintegert;
                     vertexpath: ptr igraphvectorintt;
                     edgepath: ptr igraphvectorintt; directed: igraphboolt;
                     unconn: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_diameter".}
proc igraphdiameterdijkstra*(graph: ptr igrapht; weights: ptr igraphvectort;
                             res: ptr igraphrealt; fromarg: ptr igraphintegert;
                             to: ptr igraphintegert;
                             vertexpath: ptr igraphvectorintt;
                             edgepath: ptr igraphvectorintt;
                             directed: igraphboolt; unconn: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_diameter_dijkstra".}
proc igraphdistancescutoff*(graph: ptr igrapht; res: ptr igraphmatrixt;
                            fromarg: igraphvst; to: igraphvst;
                            mode: igraphneimodet; cutoff: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_distances_cutoff".}
proc igraphdistances*(graph: ptr igrapht; res: ptr igraphmatrixt;
                      fromarg: igraphvst; to: igraphvst; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_distances".}
proc igraphdistancesbellmanford*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                 fromarg: igraphvst; to: igraphvst;
                                 weights: ptr igraphvectort;
                                 mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_distances_bellman_ford".}
proc igraphdistancesdijkstracutoff*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                    fromarg: igraphvst; to: igraphvst;
                                    weights: ptr igraphvectort;
                                    mode: igraphneimodet; cutoff: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_distances_dijkstra_cutoff".}
proc igraphdistancesdijkstra*(graph: ptr igrapht; res: ptr igraphmatrixt;
                              fromarg: igraphvst; to: igraphvst;
                              weights: ptr igraphvectort; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_distances_dijkstra".}
proc igraphdistancesjohnson*(graph: ptr igrapht; res: ptr igraphmatrixt;
                             fromarg: igraphvst; to: igraphvst;
                             weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_distances_johnson".}
proc igraphdistancesfloydwarshall*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                   fromarg: igraphvst; to: igraphvst;
                                   weights: ptr igraphvectort;
                                   mode: igraphneimodet;
                                   methodarg: igraphfloydwarshallalgorithmt): igrapherrort {.
    cdecl, importc: "igraph_distances_floyd_warshall".}
proc igraphshortestpaths*(graph: ptr igrapht; res: ptr igraphmatrixt;
                          fromarg: igraphvst; to: igraphvst;
                          mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_shortest_paths".}
proc igraphshortestpathsbellmanford*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                     fromarg: igraphvst; to: igraphvst;
                                     weights: ptr igraphvectort;
                                     mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_shortest_paths_bellman_ford".}
proc igraphshortestpathsdijkstra*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                  fromarg: igraphvst; to: igraphvst;
                                  weights: ptr igraphvectort;
                                  mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_shortest_paths_dijkstra".}
proc igraphshortestpathsjohnson*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                 fromarg: igraphvst; to: igraphvst;
                                 weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_shortest_paths_johnson".}
proc igraphgetshortestpaths*(graph: ptr igrapht;
                             vertices: ptr igraphvectorintlistt;
                             edges: ptr igraphvectorintlistt;
                             fromarg: igraphintegert; to: igraphvst;
                             mode: igraphneimodet;
                             parents: ptr igraphvectorintt;
                             inboundedges: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_get_shortest_paths".}
proc igraphgetshortestpathsbellmanford*(graph: ptr igrapht;
                                        vertices: ptr igraphvectorintlistt;
                                        edges: ptr igraphvectorintlistt;
                                        fromarg: igraphintegert; to: igraphvst;
                                        weights: ptr igraphvectort;
                                        mode: igraphneimodet;
                                        parents: ptr igraphvectorintt;
                                        inboundedges: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_get_shortest_paths_bellman_ford".}
proc igraphgetshortestpathsdijkstra*(graph: ptr igrapht;
                                     vertices: ptr igraphvectorintlistt;
                                     edges: ptr igraphvectorintlistt;
                                     fromarg: igraphintegert; to: igraphvst;
                                     weights: ptr igraphvectort;
                                     mode: igraphneimodet;
                                     parents: ptr igraphvectorintt;
                                     inboundedges: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_get_shortest_paths_dijkstra".}
proc igraphgetshortestpath*(graph: ptr igrapht; vertices: ptr igraphvectorintt;
                            edges: ptr igraphvectorintt;
                            fromarg: igraphintegert; to: igraphintegert;
                            mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_get_shortest_path".}
proc igraphgetshortestpathbellmanford*(graph: ptr igrapht;
                                       vertices: ptr igraphvectorintt;
                                       edges: ptr igraphvectorintt;
                                       fromarg: igraphintegert;
                                       to: igraphintegert;
                                       weights: ptr igraphvectort;
                                       mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_get_shortest_path_bellman_ford".}
proc igraphgetshortestpathdijkstra*(graph: ptr igrapht;
                                    vertices: ptr igraphvectorintt;
                                    edges: ptr igraphvectorintt;
                                    fromarg: igraphintegert; to: igraphintegert;
                                    weights: ptr igraphvectort;
                                    mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_get_shortest_path_dijkstra".}
proc igraphgetshortestpathastar*(graph: ptr igrapht;
                                 vertices: ptr igraphvectorintt;
                                 edges: ptr igraphvectorintt;
                                 fromarg: igraphintegert; to: igraphintegert;
                                 weights: ptr igraphvectort;
                                 mode: igraphneimodet;
                                 heuristic: igraphastarheuristicfunct;
                                 extra: pointer): igrapherrort {.cdecl,
    importc: "igraph_get_shortest_path_astar".}
proc igraphgetallshortestpaths*(graph: ptr igrapht;
                                vertices: ptr igraphvectorintlistt;
                                edges: ptr igraphvectorintlistt;
                                nrgeo: ptr igraphvectorintt;
                                fromarg: igraphintegert; to: igraphvst;
                                mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_get_all_shortest_paths".}
proc igraphgetallshortestpathsdijkstra*(graph: ptr igrapht;
                                        vertices: ptr igraphvectorintlistt;
                                        edges: ptr igraphvectorintlistt;
                                        nrgeo: ptr igraphvectorintt;
                                        fromarg: igraphintegert; to: igraphvst;
                                        weights: ptr igraphvectort;
                                        mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_get_all_shortest_paths_dijkstra".}
proc igraphaveragepathlength*(graph: ptr igrapht; res: ptr igraphrealt;
                              unconnpairs: ptr igraphrealt;
                              directed: igraphboolt; unconn: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_average_path_length".}
proc igraphaveragepathlengthdijkstra*(graph: ptr igrapht; res: ptr igraphrealt;
                                      unconnpairs: ptr igraphrealt;
                                      weights: ptr igraphvectort;
                                      directed: igraphboolt; unconn: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_average_path_length_dijkstra".}
proc igraphpathlengthhist*(graph: ptr igrapht; res: ptr igraphvectort;
                           unconnected: ptr igraphrealt; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_path_length_hist".}
proc igraphglobalefficiency*(graph: ptr igrapht; res: ptr igraphrealt;
                             weights: ptr igraphvectort; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_global_efficiency".}
proc igraphlocalefficiency*(graph: ptr igrapht; res: ptr igraphvectort;
                            vids: igraphvst; weights: ptr igraphvectort;
                            directed: igraphboolt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_local_efficiency".}
proc igraphaveragelocalefficiency*(graph: ptr igrapht; res: ptr igraphrealt;
                                   weights: ptr igraphvectort;
                                   directed: igraphboolt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_average_local_efficiency".}
proc igrapheccentricity*(graph: ptr igrapht; res: ptr igraphvectort;
                         vids: igraphvst; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_eccentricity".}
proc igrapheccentricitydijkstra*(graph: ptr igrapht; weights: ptr igraphvectort;
                                 res: ptr igraphvectort; vids: igraphvst;
                                 mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_eccentricity_dijkstra".}
proc igraphradius*(graph: ptr igrapht; radius: ptr igraphrealt;
                   mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_radius".}
proc igraphradiusdijkstra*(graph: ptr igrapht; weights: ptr igraphvectort;
                           radius: ptr igraphrealt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_radius_dijkstra".}
proc igraphgraphcenter*(graph: ptr igrapht; res: ptr igraphvectorintt;
                        mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_graph_center".}
proc igraphgraphcenterdijkstra*(graph: ptr igrapht; weights: ptr igraphvectort;
                                res: ptr igraphvectorintt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_graph_center_dijkstra".}
proc igraphpseudodiameter*(graph: ptr igrapht; diameter: ptr igraphrealt;
                           vidstart: igraphintegert;
                           fromarg: ptr igraphintegert; to: ptr igraphintegert;
                           directed: igraphboolt; unconn: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_pseudo_diameter".}
proc igraphpseudodiameterdijkstra*(graph: ptr igrapht;
                                   weights: ptr igraphvectort;
                                   diameter: ptr igraphrealt;
                                   vidstart: igraphintegert;
                                   fromarg: ptr igraphintegert;
                                   to: ptr igraphintegert;
                                   directed: igraphboolt; unconn: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_pseudo_diameter_dijkstra".}
proc igraphgetallsimplepaths*(graph: ptr igrapht; res: ptr igraphvectorintt;
                              fromarg: igraphintegert; to: igraphvst;
                              cutoff: igraphintegert; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_get_all_simple_paths".}
proc igraphrandomwalk*(graph: ptr igrapht; weights: ptr igraphvectort;
                       vertices: ptr igraphvectorintt;
                       edges: ptr igraphvectorintt; start: igraphintegert;
                       mode: igraphneimodet; steps: igraphintegert;
                       stuck: igraphrandomwalkstuckt): igrapherrort {.cdecl,
    importc: "igraph_random_walk".}
proc igraphgetkshortestpaths*(graph: ptr igrapht; weights: ptr igraphvectort;
                              vertexpaths: ptr igraphvectorintlistt;
                              edgepaths: ptr igraphvectorintlistt;
                              k: igraphintegert; fromarg: igraphintegert;
                              to: igraphintegert; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_get_k_shortest_paths".}
proc igraphspanner*(graph: ptr igrapht; spanner: ptr igraphvectorintt;
                    stretch: igraphrealt; weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_spanner".}
proc igraphgetwidestpaths*(graph: ptr igrapht;
                           vertices: ptr igraphvectorintlistt;
                           edges: ptr igraphvectorintlistt;
                           fromarg: igraphintegert; to: igraphvst;
                           weights: ptr igraphvectort; mode: igraphneimodet;
                           parents: ptr igraphvectorintt;
                           inboundedges: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_get_widest_paths".}
proc igraphgetwidestpath*(graph: ptr igrapht; vertices: ptr igraphvectorintt;
                          edges: ptr igraphvectorintt; fromarg: igraphintegert;
                          to: igraphintegert; weights: ptr igraphvectort;
                          mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_get_widest_path".}
proc igraphwidestpathwidthsfloydwarshall*(graph: ptr igrapht;
    res: ptr igraphmatrixt; fromarg: igraphvst; to: igraphvst;
    weights: ptr igraphvectort; mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_widest_path_widths_floyd_warshall".}
proc igraphwidestpathwidthsdijkstra*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                     fromarg: igraphvst; to: igraphvst;
                                     weights: ptr igraphvectort;
                                     mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_widest_path_widths_dijkstra".}
proc igraphvoronoi*(graph: ptr igrapht; membership: ptr igraphvectorintt;
                    distances: ptr igraphvectort;
                    generators: ptr igraphvectorintt;
                    weights: ptr igraphvectort; mode: igraphneimodet;
                    tiebreaker: igraphvoronoitiebreakert): igrapherrort {.cdecl,
    importc: "igraph_voronoi".}
proc igraphexpandpathtopairs*(path: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_expand_path_to_pairs".}
proc igraphvertexpathfromedgepath*(graph: ptr igrapht; start: igraphintegert;
                                   edgepath: ptr igraphvectorintt;
                                   vertexpath: ptr igraphvectorintt;
                                   mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_vertex_path_from_edge_path".}
proc igraphrandomedgewalk*(graph: ptr igrapht; weights: ptr igraphvectort;
                           edgewalk: ptr igraphvectorintt;
                           start: igraphintegert; mode: igraphneimodet;
                           steps: igraphintegert; stuck: igraphrandomwalkstuckt): igrapherrort {.
    cdecl, importc: "igraph_random_edge_walk".}
proc igraphclusters*(graph: ptr igrapht; membership: ptr igraphvectorintt;
                     csize: ptr igraphvectorintt; no: ptr igraphintegert;
                     mode: igraphconnectednesst): igrapherrort {.cdecl,
    importc: "igraph_clusters".}
proc igraphconnectedcomponents*(graph: ptr igrapht;
                                membership: ptr igraphvectorintt;
                                csize: ptr igraphvectorintt;
                                no: ptr igraphintegert;
                                mode: igraphconnectednesst): igrapherrort {.
    cdecl, importc: "igraph_connected_components".}
proc igraphisconnected*(graph: ptr igrapht; res: ptr igraphboolt;
                        mode: igraphconnectednesst): igrapherrort {.cdecl,
    importc: "igraph_is_connected".}
proc igraphdecompose*(graph: ptr igrapht; components: ptr igraphgraphlistt;
                      mode: igraphconnectednesst; maxcompno: igraphintegert;
                      minelements: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_decompose".}
proc igrapharticulationpoints*(graph: ptr igrapht; res: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_articulation_points".}
proc igraphbiconnectedcomponents*(graph: ptr igrapht; no: ptr igraphintegert;
                                  treeedges: ptr igraphvectorintlistt;
                                  componentedges: ptr igraphvectorintlistt;
                                  components: ptr igraphvectorintlistt;
                                  articulationpoints: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_biconnected_components".}
proc igraphisbiconnected*(graph: ptr igrapht; result: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_is_biconnected".}
proc igraphbridges*(graph: ptr igrapht; bridges: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_bridges".}
proc igraphdecomposedestroy*(complist: ptr igraphvectorptrt): void {.cdecl,
    importc: "igraph_decompose_destroy".}
proc igraphareadjacent*(graph: ptr igrapht; v1: igraphintegert;
                        v2: igraphintegert; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_are_adjacent".}
proc igraphareconnected*(graph: ptr igrapht; v1: igraphintegert;
                         v2: igraphintegert; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_are_connected".}
proc igraphcountmultiple*(graph: ptr igrapht; res: ptr igraphvectorintt;
                          es: igraphest): igrapherrort {.cdecl,
    importc: "igraph_count_multiple".}
proc igraphcountmultiple1*(graph: ptr igrapht; res: ptr igraphintegert;
                           eid: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_count_multiple_1".}
proc igraphdensity*(graph: ptr igrapht; res: ptr igraphrealt; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_density".}
proc igraphdiversity*(graph: ptr igrapht; weights: ptr igraphvectort;
                      res: ptr igraphvectort; vs: igraphvst): igrapherrort {.
    cdecl, importc: "igraph_diversity".}
proc igraphgirth*(graph: ptr igrapht; girth: ptr igraphrealt;
                  circle: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_girth".}
proc igraphhasloop*(graph: ptr igrapht; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_has_loop".}
proc igraphhasmultiple*(graph: ptr igrapht; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_has_multiple".}
proc igraphisloop*(graph: ptr igrapht; res: ptr igraphvectorboolt; es: igraphest): igrapherrort {.
    cdecl, importc: "igraph_is_loop".}
proc igraphismultiple*(graph: ptr igrapht; res: ptr igraphvectorboolt;
                       es: igraphest): igrapherrort {.cdecl,
    importc: "igraph_is_multiple".}
proc igraphismutual*(graph: ptr igrapht; res: ptr igraphvectorboolt;
                     es: igraphest; loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_mutual".}
proc igraphhasmutual*(graph: ptr igrapht; res: ptr igraphboolt;
                      loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_has_mutual".}
proc igraphissimple*(graph: ptr igrapht; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_is_simple".}
proc igraphistree*(graph: ptr igrapht; res: ptr igraphboolt;
                   root: ptr igraphintegert; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_is_tree".}
proc igraphisacyclic*(graph: ptr igrapht; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_is_acyclic".}
proc igraphisforest*(graph: ptr igrapht; res: ptr igraphboolt;
                     roots: ptr igraphvectorintt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_is_forest".}
proc igraphmaxdegree*(graph: ptr igrapht; res: ptr igraphintegert;
                      vids: igraphvst; mode: igraphneimodet; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_maxdegree".}
proc igraphreciprocity*(graph: ptr igrapht; res: ptr igraphrealt;
                        ignoreloops: igraphboolt; mode: igraphreciprocityt): igrapherrort {.
    cdecl, importc: "igraph_reciprocity".}
proc igraphstrength*(graph: ptr igrapht; res: ptr igraphvectort;
                     vids: igraphvst; mode: igraphneimodet; loops: igraphboolt;
                     weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_strength".}
proc igraphsortvertexidsbydegree*(graph: ptr igrapht;
                                  outvids: ptr igraphvectorintt;
                                  vids: igraphvst; mode: igraphneimodet;
                                  loops: igraphboolt; order: igraphordert;
                                  onlyindices: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_sort_vertex_ids_by_degree".}
proc igraphisperfect*(graph: ptr igrapht; perfect: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_is_perfect".}
proc igraphiscomplete*(graph: ptr igrapht; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_is_complete".}
proc igraphminimumspanningtree*(graph: ptr igrapht; res: ptr igraphvectorintt;
                                weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_minimum_spanning_tree".}
proc igraphminimumspanningtreeunweighted*(graph: ptr igrapht; mst: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_minimum_spanning_tree_unweighted".}
proc igraphminimumspanningtreeprim*(graph: ptr igrapht; mst: ptr igrapht;
                                    weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_minimum_spanning_tree_prim".}
proc igraphrandomspanningtree*(graph: ptr igrapht; res: ptr igraphvectorintt;
                               vid: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_random_spanning_tree".}
proc igraphsubcomponent*(graph: ptr igrapht; res: ptr igraphvectorintt;
                         vid: igraphintegert; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_subcomponent".}
proc igraphunfoldtree*(graph: ptr igrapht; tree: ptr igrapht;
                       mode: igraphneimodet; roots: ptr igraphvectorintt;
                       vertexindex: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_unfold_tree".}
proc igraphmaximumcardinalitysearch*(graph: ptr igrapht;
                                     alpha: ptr igraphvectorintt;
                                     alpham1: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_maximum_cardinality_search".}
proc igraphischordal*(graph: ptr igrapht; alpha: ptr igraphvectorintt;
                      alpham1: ptr igraphvectorintt; chordal: ptr igraphboolt;
                      fillin: ptr igraphvectorintt; newgraph: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_is_chordal".}
proc igraphavgnearestneighbordegree*(graph: ptr igrapht; vids: igraphvst;
                                     mode: igraphneimodet;
                                     neighbordegreemode: igraphneimodet;
                                     knn: ptr igraphvectort;
                                     knnk: ptr igraphvectort;
                                     weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_avg_nearest_neighbor_degree".}
proc igraphdegreecorrelationvector*(graph: ptr igrapht;
                                    weights: ptr igraphvectort;
                                    knnk: ptr igraphvectort;
                                    frommode: igraphneimodet;
                                    tomode: igraphneimodet;
                                    directedneighbors: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_degree_correlation_vector".}
proc igraphfeedbackarcset*(graph: ptr igrapht; result: ptr igraphvectorintt;
                           weights: ptr igraphvectort; algo: igraphfasalgorithmt): igrapherrort {.
    cdecl, importc: "igraph_feedback_arc_set".}
proc igraphgetlaplacian*(graph: ptr igrapht; res: ptr igraphmatrixt;
                         mode: igraphneimodet;
                         normalization: igraphlaplaciannormalizationt;
                         weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_get_laplacian".}
proc igraphgetlaplaciansparse*(graph: ptr igrapht;
                               sparseres: ptr igraphsparsematt;
                               mode: igraphneimodet;
                               normalization: igraphlaplaciannormalizationt;
                               weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_get_laplacian_sparse".}
proc igraphlaplacian*(graph: ptr igrapht; res: ptr igraphmatrixt;
                      sparseres: ptr igraphsparsematt; normalized: igraphboolt;
                      weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_laplacian".}
proc igraphtransitivityundirected*(graph: ptr igrapht; res: ptr igraphrealt;
                                   mode: igraphtransitivitymodet): igrapherrort {.
    cdecl, importc: "igraph_transitivity_undirected".}
proc igraphtransitivitylocalundirected*(graph: ptr igrapht;
                                        res: ptr igraphvectort; vids: igraphvst;
                                        mode: igraphtransitivitymodet): igrapherrort {.
    cdecl, importc: "igraph_transitivity_local_undirected".}
proc igraphtransitivityavglocalundirected*(graph: ptr igrapht;
    res: ptr igraphrealt; mode: igraphtransitivitymodet): igrapherrort {.cdecl,
    importc: "igraph_transitivity_avglocal_undirected".}
proc igraphtransitivitybarrat*(graph: ptr igrapht; res: ptr igraphvectort;
                               vids: igraphvst; weights: ptr igraphvectort;
                               mode: igraphtransitivitymodet): igrapherrort {.
    cdecl, importc: "igraph_transitivity_barrat".}
proc igraphecc*(graph: ptr igrapht; res: ptr igraphvectort; eids: igraphest;
                k: igraphintegert; offset: igraphboolt; normalize: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_ecc".}
proc igraphneighborhoodsize*(graph: ptr igrapht; res: ptr igraphvectorintt;
                             vids: igraphvst; order: igraphintegert;
                             mode: igraphneimodet; mindist: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_neighborhood_size".}
proc igraphneighborhood*(graph: ptr igrapht; res: ptr igraphvectorintlistt;
                         vids: igraphvst; order: igraphintegert;
                         mode: igraphneimodet; mindist: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_neighborhood".}
proc igraphneighborhoodgraphs*(graph: ptr igrapht; res: ptr igraphgraphlistt;
                               vids: igraphvst; order: igraphintegert;
                               mode: igraphneimodet; mindist: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_neighborhood_graphs".}
proc igraphtopologicalsorting*(graph: ptr igrapht; res: ptr igraphvectorintt;
                               mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_topological_sorting".}
proc igraphisdag*(graph: ptr igrapht; res: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_is_dag".}
proc igraphtransitiveclosuredag*(graph: ptr igrapht; closure: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_transitive_closure_dag".}
proc igraphsimplifyandcolorize*(graph: ptr igrapht; res: ptr igrapht;
                                vertexcolor: ptr igraphvectorintt;
                                edgecolor: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_simplify_and_colorize".}
proc igraphisomorphic*(graph1: ptr igrapht; graph2: ptr igrapht;
                       iso: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_isomorphic".}
proc igraphsubisomorphic*(graph1: ptr igrapht; graph2: ptr igrapht;
                          iso: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_subisomorphic".}
proc igraphsubisomorphiclad*(pattern: ptr igrapht; target: ptr igrapht;
                             domains: ptr igraphvectorintlistt;
                             iso: ptr igraphboolt; map: ptr igraphvectorintt;
                             maps: ptr igraphvectorintlistt;
                             induced: igraphboolt; timelimit: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_subisomorphic_lad".}
proc igraphisomorphicvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                          vertexcolor1: ptr igraphvectorintt;
                          vertexcolor2: ptr igraphvectorintt;
                          edgecolor1: ptr igraphvectorintt;
                          edgecolor2: ptr igraphvectorintt;
                          iso: ptr igraphboolt; map12: ptr igraphvectorintt;
                          map21: ptr igraphvectorintt;
                          nodecompatfn: igraphisocompatt;
                          edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_isomorphic_vf2".}
proc igraphcountisomorphismsvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                                 vertexcolor1: ptr igraphvectorintt;
                                 vertexcolor2: ptr igraphvectorintt;
                                 edgecolor1: ptr igraphvectorintt;
                                 edgecolor2: ptr igraphvectorintt;
                                 count: ptr igraphintegert;
                                 nodecompatfn: igraphisocompatt;
                                 edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_count_isomorphisms_vf2".}
proc igraphgetisomorphismsvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                               vertexcolor1: ptr igraphvectorintt;
                               vertexcolor2: ptr igraphvectorintt;
                               edgecolor1: ptr igraphvectorintt;
                               edgecolor2: ptr igraphvectorintt;
                               maps: ptr igraphvectorintlistt;
                               nodecompatfn: igraphisocompatt;
                               edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_get_isomorphisms_vf2".}
proc igraphgetisomorphismsvf2callback*(graph1: ptr igrapht; graph2: ptr igrapht;
                                       vertexcolor1: ptr igraphvectorintt;
                                       vertexcolor2: ptr igraphvectorintt;
                                       edgecolor1: ptr igraphvectorintt;
                                       edgecolor2: ptr igraphvectorintt;
                                       map12: ptr igraphvectorintt;
                                       map21: ptr igraphvectorintt;
                                       isohandlerfn: igraphisohandlert;
                                       nodecompatfn: igraphisocompatt;
                                       edgecompatfn: igraphisocompatt;
                                       arg: pointer): igrapherrort {.cdecl,
    importc: "igraph_get_isomorphisms_vf2_callback".}
proc igraphisomorphicfunctionvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                                  vertexcolor1: ptr igraphvectorintt;
                                  vertexcolor2: ptr igraphvectorintt;
                                  edgecolor1: ptr igraphvectorintt;
                                  edgecolor2: ptr igraphvectorintt;
                                  map12: ptr igraphvectorintt;
                                  map21: ptr igraphvectorintt;
                                  isohandlerfn: igraphisohandlert;
                                  nodecompatfn: igraphisocompatt;
                                  edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_isomorphic_function_vf2".}
proc igraphsubisomorphicvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                             vertexcolor1: ptr igraphvectorintt;
                             vertexcolor2: ptr igraphvectorintt;
                             edgecolor1: ptr igraphvectorintt;
                             edgecolor2: ptr igraphvectorintt;
                             iso: ptr igraphboolt; map12: ptr igraphvectorintt;
                             map21: ptr igraphvectorintt;
                             nodecompatfn: igraphisocompatt;
                             edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_subisomorphic_vf2".}
proc igraphcountsubisomorphismsvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                                    vertexcolor1: ptr igraphvectorintt;
                                    vertexcolor2: ptr igraphvectorintt;
                                    edgecolor1: ptr igraphvectorintt;
                                    edgecolor2: ptr igraphvectorintt;
                                    count: ptr igraphintegert;
                                    nodecompatfn: igraphisocompatt;
                                    edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_count_subisomorphisms_vf2".}
proc igraphgetsubisomorphismsvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                                  vertexcolor1: ptr igraphvectorintt;
                                  vertexcolor2: ptr igraphvectorintt;
                                  edgecolor1: ptr igraphvectorintt;
                                  edgecolor2: ptr igraphvectorintt;
                                  maps: ptr igraphvectorintlistt;
                                  nodecompatfn: igraphisocompatt;
                                  edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_get_subisomorphisms_vf2".}
proc igraphgetsubisomorphismsvf2callback*(graph1: ptr igrapht;
    graph2: ptr igrapht; vertexcolor1: ptr igraphvectorintt;
    vertexcolor2: ptr igraphvectorintt; edgecolor1: ptr igraphvectorintt;
    edgecolor2: ptr igraphvectorintt; map12: ptr igraphvectorintt;
    map21: ptr igraphvectorintt; isohandlerfn: igraphisohandlert;
    nodecompatfn: igraphisocompatt; edgecompatfn: igraphisocompatt; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_get_subisomorphisms_vf2_callback".}
proc igraphsubisomorphicfunctionvf2*(graph1: ptr igrapht; graph2: ptr igrapht;
                                     vertexcolor1: ptr igraphvectorintt;
                                     vertexcolor2: ptr igraphvectorintt;
                                     edgecolor1: ptr igraphvectorintt;
                                     edgecolor2: ptr igraphvectorintt;
                                     map12: ptr igraphvectorintt;
                                     map21: ptr igraphvectorintt;
                                     isohandlerfn: igraphisohandlert;
                                     nodecompatfn: igraphisocompatt;
                                     edgecompatfn: igraphisocompatt;
                                     arg: pointer): igrapherrort {.cdecl,
    importc: "igraph_subisomorphic_function_vf2".}
proc igraphcanonicalpermutation*(graph: ptr igrapht;
                                 colors: ptr igraphvectorintt;
                                 labeling: ptr igraphvectorintt;
                                 sh: igraphblisssht; info: ptr igraphblissinfot): igrapherrort {.
    cdecl, importc: "igraph_canonical_permutation".}
proc igraphisomorphicbliss*(graph1: ptr igrapht; graph2: ptr igrapht;
                            colors1: ptr igraphvectorintt;
                            colors2: ptr igraphvectorintt; iso: ptr igraphboolt;
                            map12: ptr igraphvectorintt;
                            map21: ptr igraphvectorintt; sh: igraphblisssht;
                            info1: ptr igraphblissinfot;
                            info2: ptr igraphblissinfot): igrapherrort {.cdecl,
    importc: "igraph_isomorphic_bliss".}
proc igraphcountautomorphisms*(graph: ptr igrapht; colors: ptr igraphvectorintt;
                               sh: igraphblisssht; info: ptr igraphblissinfot): igrapherrort {.
    cdecl, importc: "igraph_count_automorphisms".}
proc igraphautomorphisms*(graph: ptr igrapht; colors: ptr igraphvectorintt;
                          sh: igraphblisssht; info: ptr igraphblissinfot): igrapherrort {.
    cdecl, importc: "igraph_automorphisms".}
proc igraphautomorphismgroup*(graph: ptr igrapht; colors: ptr igraphvectorintt;
                              generators: ptr igraphvectorintlistt;
                              sh: igraphblisssht; info: ptr igraphblissinfot): igrapherrort {.
    cdecl, importc: "igraph_automorphism_group".}
proc igraphisomorphicsmall*(graph1: ptr igrapht; graph2: ptr igrapht;
                            iso: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_isomorphic_small".}
proc igraphisoclass*(graph: ptr igrapht; isoclass: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_isoclass".}
proc igraphisoclasssubgraph*(graph: ptr igrapht; vids: ptr igraphvectorintt;
                             isoclass: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_isoclass_subgraph".}
proc igraphisoclasscreate*(graph: ptr igrapht; size: igraphintegert;
                           number: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_isoclass_create".}
proc igraphgraphcount*(n: igraphintegert; directed: igraphboolt;
                       count: ptr igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_graph_count".}
proc igraphisomorphic34*(graph1: ptr igrapht; graph2: ptr igrapht;
                         iso: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_isomorphic_34".}
proc igraphfullbipartite*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                          n1: igraphintegert; n2: igraphintegert;
                          directed: igraphboolt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_full_bipartite".}
proc igraphcreatebipartite*(g: ptr igrapht; types: ptr igraphvectorboolt;
                            edges: ptr igraphvectorintt; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_create_bipartite".}
proc igraphbipartiteprojectionsize*(graph: ptr igrapht;
                                    types: ptr igraphvectorboolt;
                                    vcount1: ptr igraphintegert;
                                    ecount1: ptr igraphintegert;
                                    vcount2: ptr igraphintegert;
                                    ecount2: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_bipartite_projection_size".}
proc igraphbipartiteprojection*(graph: ptr igrapht;
                                types: ptr igraphvectorboolt;
                                proj1: ptr igrapht; proj2: ptr igrapht;
                                multiplicity1: ptr igraphvectorintt;
                                multiplicity2: ptr igraphvectorintt;
                                probe1: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_bipartite_projection".}
proc igraphbiadjacency*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                        input: ptr igraphmatrixt; directed: igraphboolt;
                        mode: igraphneimodet; multiple: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_biadjacency".}
proc igraphgetbiadjacency*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                           res: ptr igraphmatrixt; rowids: ptr igraphvectorintt;
                           colids: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_get_biadjacency".}
proc igraphisbipartite*(graph: ptr igrapht; res: ptr igraphboolt;
                        types: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_is_bipartite".}
proc igraphbipartitegamegnp*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                             n1: igraphintegert; n2: igraphintegert;
                             p: igraphrealt; directed: igraphboolt;
                             mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_bipartite_game_gnp".}
proc igraphbipartitegamegnm*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                             n1: igraphintegert; n2: igraphintegert;
                             m: igraphintegert; directed: igraphboolt;
                             mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_bipartite_game_gnm".}
proc igraphincidence*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                      incidence: ptr igraphmatrixt; directed: igraphboolt;
                      mode: igraphneimodet; multiple: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_incidence".}
proc igraphgetincidence*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                         res: ptr igraphmatrixt; rowids: ptr igraphvectorintt;
                         colids: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_get_incidence".}
proc igraphbipartitegame*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                          typearg: igrapherdosrenyit; n1: igraphintegert;
                          n2: igraphintegert; p: igraphrealt; m: igraphintegert;
                          directed: igraphboolt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_bipartite_game".}
proc igraphmaximalcliques*(graph: ptr igrapht; res: ptr igraphvectorintlistt;
                           minsize: igraphintegert; maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_maximal_cliques".}
proc igraphmaximalcliquesfile*(graph: ptr igrapht; outfile: ptr File;
                               minsize: igraphintegert; maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_maximal_cliques_file".}
proc igraphmaximalcliquescount*(graph: ptr igrapht; res: ptr igraphintegert;
                                minsize: igraphintegert; maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_maximal_cliques_count".}
proc igraphmaximalcliquessubset*(graph: ptr igrapht;
                                 subset: ptr igraphvectorintt;
                                 res: ptr igraphvectorintlistt;
                                 no: ptr igraphintegert; outfile: ptr File;
                                 minsize: igraphintegert;
                                 maxsize: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_maximal_cliques_subset".}
proc igraphmaximalcliqueshist*(graph: ptr igrapht; hist: ptr igraphvectort;
                               minsize: igraphintegert; maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_maximal_cliques_hist".}
proc igraphcliques*(graph: ptr igrapht; res: ptr igraphvectorintlistt;
                    minsize: igraphintegert; maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_cliques".}
proc igraphcliquesizehist*(graph: ptr igrapht; hist: ptr igraphvectort;
                           minsize: igraphintegert; maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_clique_size_hist".}
proc igraphlargestcliques*(graph: ptr igrapht; cliques: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_largest_cliques".}
proc igraphcliquenumber*(graph: ptr igrapht; no: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_clique_number".}
proc igraphweightedcliques*(graph: ptr igrapht;
                            vertexweights: ptr igraphvectort;
                            res: ptr igraphvectorintlistt;
                            minweight: igraphrealt; maxweight: igraphrealt;
                            maximal: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_weighted_cliques".}
proc igraphlargestweightedcliques*(graph: ptr igrapht;
                                   vertexweights: ptr igraphvectort;
                                   res: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_largest_weighted_cliques".}
proc igraphweightedcliquenumber*(graph: ptr igrapht;
                                 vertexweights: ptr igraphvectort;
                                 res: ptr igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_weighted_clique_number".}
proc igraphindependentvertexsets*(graph: ptr igrapht;
                                  res: ptr igraphvectorintlistt;
                                  minsize: igraphintegert;
                                  maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_independent_vertex_sets".}
proc igraphlargestindependentvertexsets*(graph: ptr igrapht;
    res: ptr igraphvectorintlistt): igrapherrort {.cdecl,
    importc: "igraph_largest_independent_vertex_sets".}
proc igraphmaximalindependentvertexsets*(graph: ptr igrapht;
    res: ptr igraphvectorintlistt): igrapherrort {.cdecl,
    importc: "igraph_maximal_independent_vertex_sets".}
proc igraphindependencenumber*(graph: ptr igrapht; no: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_independence_number".}
proc igraphcliquescallback*(graph: ptr igrapht; minsize: igraphintegert;
                            maxsize: igraphintegert;
                            cliquehandlerfn: igraphcliquehandlert; arg: pointer): igrapherrort {.
    cdecl, importc: "igraph_cliques_callback".}
proc igraphmaximalcliquescallback*(graph: ptr igrapht;
                                   cliquehandlerfn: igraphcliquehandlert;
                                   arg: pointer; minsize: igraphintegert;
                                   maxsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_maximal_cliques_callback".}
proc igraphlayoutrandom*(graph: ptr igrapht; res: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_layout_random".}
proc igraphlayoutcircle*(graph: ptr igrapht; res: ptr igraphmatrixt;
                         order: igraphvst): igrapherrort {.cdecl,
    importc: "igraph_layout_circle".}
proc igraphlayoutstar*(graph: ptr igrapht; res: ptr igraphmatrixt;
                       center: igraphintegert; order: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_layout_star".}
proc igraphlayoutgrid*(graph: ptr igrapht; res: ptr igraphmatrixt;
                       width: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_layout_grid".}
proc igraphlayoutfruchtermanreingold*(graph: ptr igrapht;
                                      res: ptr igraphmatrixt;
                                      useseed: igraphboolt;
                                      niter: igraphintegert;
                                      starttemp: igraphrealt;
                                      grid: igraphlayoutgridt;
                                      weights: ptr igraphvectort;
                                      minx: ptr igraphvectort;
                                      maxx: ptr igraphvectort;
                                      miny: ptr igraphvectort;
                                      maxy: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_layout_fruchterman_reingold".}
proc igraphlayoutkamadakawai*(graph: ptr igrapht; res: ptr igraphmatrixt;
                              useseed: igraphboolt; maxiter: igraphintegert;
                              epsilon: igraphrealt; kkconst: igraphrealt;
                              weights: ptr igraphvectort;
                              minx: ptr igraphvectort; maxx: ptr igraphvectort;
                              miny: ptr igraphvectort; maxy: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_layout_kamada_kawai".}
proc igraphlayoutlgl*(graph: ptr igrapht; res: ptr igraphmatrixt;
                      maxiter: igraphintegert; maxdelta: igraphrealt;
                      area: igraphrealt; coolexp: igraphrealt;
                      repulserad: igraphrealt; cellsize: igraphrealt;
                      root: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_layout_lgl".}
proc igraphlayoutreingoldtilford*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                  mode: igraphneimodet;
                                  roots: ptr igraphvectorintt;
                                  rootlevel: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_layout_reingold_tilford".}
proc igraphlayoutreingoldtilfordcircular*(graph: ptr igrapht;
    res: ptr igraphmatrixt; mode: igraphneimodet; roots: ptr igraphvectorintt;
    rootlevel: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_layout_reingold_tilford_circular".}
proc igraphlayoutsugiyama*(graph: ptr igrapht; res: ptr igraphmatrixt;
                           extdgraph: ptr igrapht;
                           extdtoorigeids: ptr igraphvectorintt;
                           layers: ptr igraphvectorintt; hgap: igraphrealt;
                           vgap: igraphrealt; maxiter: igraphintegert;
                           weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_layout_sugiyama".}
proc igraphlayoutrandom3d*(graph: ptr igrapht; res: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_layout_random_3d".}
proc igraphlayoutsphere*(graph: ptr igrapht; res: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_layout_sphere".}
proc igraphlayoutgrid3d*(graph: ptr igrapht; res: ptr igraphmatrixt;
                         width: igraphintegert; height: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_layout_grid_3d".}
proc igraphlayoutfruchtermanreingold3d*(graph: ptr igrapht;
                                        res: ptr igraphmatrixt;
                                        useseed: igraphboolt;
                                        niter: igraphintegert;
                                        starttemp: igraphrealt;
                                        weights: ptr igraphvectort;
                                        minx: ptr igraphvectort;
                                        maxx: ptr igraphvectort;
                                        miny: ptr igraphvectort;
                                        maxy: ptr igraphvectort;
                                        minz: ptr igraphvectort;
                                        maxz: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_layout_fruchterman_reingold_3d".}
proc igraphlayoutkamadakawai3d*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                useseed: igraphboolt; maxiter: igraphintegert;
                                epsilon: igraphrealt; kkconst: igraphrealt;
                                weights: ptr igraphvectort;
                                minx: ptr igraphvectort;
                                maxx: ptr igraphvectort;
                                miny: ptr igraphvectort;
                                maxy: ptr igraphvectort;
                                minz: ptr igraphvectort; maxz: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_layout_kamada_kawai_3d".}
proc igraphlayoutgraphopt*(graph: ptr igrapht; res: ptr igraphmatrixt;
                           niter: igraphintegert; nodecharge: igraphrealt;
                           nodemass: igraphrealt; springlength: igraphrealt;
                           springconstant: igraphrealt;
                           maxsamovement: igraphrealt; useseed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_layout_graphopt".}
proc igraphlayoutmds*(graph: ptr igrapht; res: ptr igraphmatrixt;
                      dist: ptr igraphmatrixt; dim: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_layout_mds".}
proc igraphlayoutbipartite*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                            res: ptr igraphmatrixt; hgap: igraphrealt;
                            vgap: igraphrealt; maxiter: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_layout_bipartite".}
proc igraphlayoutumap*(graph: ptr igrapht; res: ptr igraphmatrixt;
                       useseed: igraphboolt; distances: ptr igraphvectort;
                       mindist: igraphrealt; epochs: igraphintegert;
                       distancesareweights: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_layout_umap".}
proc igraphlayoutumap3d*(graph: ptr igrapht; res: ptr igraphmatrixt;
                         useseed: igraphboolt; distances: ptr igraphvectort;
                         mindist: igraphrealt; epochs: igraphintegert;
                         distancesareweights: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_layout_umap_3d".}
proc igraphlayoutumapcomputeweights*(graph: ptr igrapht;
                                     distances: ptr igraphvectort;
                                     weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_layout_umap_compute_weights".}
proc igraphlayoutdrloptionsinit*(options: ptr igraphlayoutdrloptionst;
                                 templ: igraphlayoutdrldefaultt): igrapherrort {.
    cdecl, importc: "igraph_layout_drl_options_init".}
proc igraphlayoutdrl*(graph: ptr igrapht; res: ptr igraphmatrixt;
                      useseed: igraphboolt;
                      options: ptr igraphlayoutdrloptionst;
                      weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_layout_drl".}
proc igraphlayoutdrl3d*(graph: ptr igrapht; res: ptr igraphmatrixt;
                        useseed: igraphboolt;
                        options: ptr igraphlayoutdrloptionst;
                        weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_layout_drl_3d".}
proc igraphlayoutmergedla*(graphs: ptr igraphvectorptrt;
                           coords: ptr igraphmatrixlistt; res: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_layout_merge_dla".}
proc igraphlayoutgem*(graph: ptr igrapht; res: ptr igraphmatrixt;
                      useseed: igraphboolt; maxiter: igraphintegert;
                      tempmax: igraphrealt; tempmin: igraphrealt;
                      tempinit: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_layout_gem".}
proc igraphlayoutdavidsonharel*(graph: ptr igrapht; res: ptr igraphmatrixt;
                                useseed: igraphboolt; maxiter: igraphintegert;
                                fineiter: igraphintegert; coolfact: igraphrealt;
                                weightnodedist: igraphrealt;
                                weightborder: igraphrealt;
                                weightedgelengths: igraphrealt;
                                weightedgecrossings: igraphrealt;
                                weightnodeedgedist: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_layout_davidson_harel".}
proc igraphrootsfortreelayout*(graph: ptr igrapht; mode: igraphneimodet;
                               roots: ptr igraphvectorintt;
                               useeccentricity: igraphrootchoicet): igrapherrort {.
    cdecl, importc: "igraph_roots_for_tree_layout".}
proc igraphbfs*(graph: ptr igrapht; root: igraphintegert;
                roots: ptr igraphvectorintt; mode: igraphneimodet;
                unreachable: igraphboolt; restricted: ptr igraphvectorintt;
                order: ptr igraphvectorintt; rank: ptr igraphvectorintt;
                parents: ptr igraphvectorintt; pred: ptr igraphvectorintt;
                succ: ptr igraphvectorintt; dist: ptr igraphvectorintt;
                callback: igraphbfshandlert; extra: pointer): igrapherrort {.
    cdecl, importc: "igraph_bfs".}
proc igraphbfssimple*(graph: ptr igrapht; root: igraphintegert;
                      mode: igraphneimodet; order: ptr igraphvectorintt;
                      layers: ptr igraphvectorintt;
                      parents: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_bfs_simple".}
proc igraphdfs*(graph: ptr igrapht; root: igraphintegert; mode: igraphneimodet;
                unreachable: igraphboolt; order: ptr igraphvectorintt;
                orderout: ptr igraphvectorintt; parents: ptr igraphvectorintt;
                dist: ptr igraphvectorintt; incallback: igraphdfshandlert;
                outcallback: igraphdfshandlert; extra: pointer): igrapherrort {.
    cdecl, importc: "igraph_dfs".}
proc igraphcoreness*(graph: ptr igrapht; cores: ptr igraphvectorintt;
                     mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_coreness".}
proc igraphtrussness*(graph: ptr igrapht; trussness: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_trussness".}
proc igraphcommunityoptimalmodularity*(graph: ptr igrapht;
                                       modularity: ptr igraphrealt;
                                       membership: ptr igraphvectorintt;
                                       weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_community_optimal_modularity".}
proc igraphcommunityspinglass*(graph: ptr igrapht; weights: ptr igraphvectort;
                               modularity: ptr igraphrealt;
                               temperature: ptr igraphrealt;
                               membership: ptr igraphvectorintt;
                               csize: ptr igraphvectorintt;
                               spins: igraphintegert; parupdate: igraphboolt;
                               starttemp: igraphrealt; stoptemp: igraphrealt;
                               coolfact: igraphrealt;
                               updaterule: igraphspincommupdatet;
                               gamma: igraphrealt;
                               implementation: igraphspinglassimplementationt;
                               gammaminus: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_community_spinglass".}
proc igraphcommunityspinglasssingle*(graph: ptr igrapht;
                                     weights: ptr igraphvectort;
                                     vertex: igraphintegert;
                                     community: ptr igraphvectorintt;
                                     cohesion: ptr igraphrealt;
                                     adhesion: ptr igraphrealt;
                                     innerlinks: ptr igraphintegert;
                                     outerlinks: ptr igraphintegert;
                                     spins: igraphintegert;
                                     updaterule: igraphspincommupdatet;
                                     gamma: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_community_spinglass_single".}
proc igraphcommunitywalktrap*(graph: ptr igrapht; weights: ptr igraphvectort;
                              steps: igraphintegert;
                              merges: ptr igraphmatrixintt;
                              modularity: ptr igraphvectort;
                              membership: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_community_walktrap".}
proc igraphcommunityinfomap*(graph: ptr igrapht; eweights: ptr igraphvectort;
                             vweights: ptr igraphvectort;
                             nbtrials: igraphintegert;
                             membership: ptr igraphvectorintt;
                             codelength: ptr igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_community_infomap".}
proc igraphcommunityedgebetweenness*(graph: ptr igrapht;
                                     removededges: ptr igraphvectorintt;
                                     edgebetweenness: ptr igraphvectort;
                                     merges: ptr igraphmatrixintt;
                                     bridges: ptr igraphvectorintt;
                                     modularity: ptr igraphvectort;
                                     membership: ptr igraphvectorintt;
                                     directed: igraphboolt;
                                     weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_community_edge_betweenness".}
proc igraphcommunityebgetmerges*(graph: ptr igrapht; directed: igraphboolt;
                                 edges: ptr igraphvectorintt;
                                 weights: ptr igraphvectort;
                                 merges: ptr igraphmatrixintt;
                                 bridges: ptr igraphvectorintt;
                                 modularity: ptr igraphvectort;
                                 membership: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_community_eb_get_merges".}
proc igraphcommunityfastgreedy*(graph: ptr igrapht; weights: ptr igraphvectort;
                                merges: ptr igraphmatrixintt;
                                modularity: ptr igraphvectort;
                                membership: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_community_fastgreedy".}
proc igraphcommunitytomembership*(merges: ptr igraphmatrixintt;
                                  nodes: igraphintegert; steps: igraphintegert;
                                  membership: ptr igraphvectorintt;
                                  csize: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_community_to_membership".}
proc igraphlecommunitytomembership*(merges: ptr igraphmatrixintt;
                                    steps: igraphintegert;
                                    membership: ptr igraphvectorintt;
                                    csize: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_le_community_to_membership".}
proc igraphcommunityvoronoi*(graph: ptr igrapht;
                             membership: ptr igraphvectorintt;
                             generators: ptr igraphvectorintt;
                             modularity: ptr igraphrealt;
                             lengths: ptr igraphvectort;
                             weights: ptr igraphvectort; mode: igraphneimodet;
                             r: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_community_voronoi".}
proc igraphmodularity*(graph: ptr igrapht; membership: ptr igraphvectorintt;
                       weights: ptr igraphvectort; resolution: igraphrealt;
                       directed: igraphboolt; modularity: ptr igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_modularity".}
proc igraphmodularitymatrix*(graph: ptr igrapht; weights: ptr igraphvectort;
                             resolution: igraphrealt; modmat: ptr igraphmatrixt;
                             directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_modularity_matrix".}
proc igraphreindexmembership*(membership: ptr igraphvectorintt;
                              newtoold: ptr igraphvectorintt;
                              nbclusters: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_reindex_membership".}
proc igraphcommunityleadingeigenvector*(graph: ptr igrapht;
                                        weights: ptr igraphvectort;
                                        merges: ptr igraphmatrixintt;
                                        membership: ptr igraphvectorintt;
                                        steps: igraphintegert;
                                        options: ptr igrapharpackoptionst;
                                        modularity: ptr igraphrealt;
                                        start: igraphboolt;
                                        eigenvalues: ptr igraphvectort;
                                        eigenvectors: ptr igraphvectorlistt;
                                        history: ptr igraphvectort; callback: igraphcommunityleadingeigenvectorcallbackt;
                                        callbackextra: pointer): igrapherrort {.
    cdecl, importc: "igraph_community_leading_eigenvector".}
proc igraphcommunityfluidcommunities*(graph: ptr igrapht;
                                      noofcommunities: igraphintegert;
                                      membership: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_community_fluid_communities".}
proc igraphcommunitylabelpropagation*(graph: ptr igrapht;
                                      membership: ptr igraphvectorintt;
                                      mode: igraphneimodet;
                                      weights: ptr igraphvectort;
                                      initial: ptr igraphvectorintt;
                                      fixed: ptr igraphvectorboolt): igrapherrort {.
    cdecl, importc: "igraph_community_label_propagation".}
proc igraphcommunitymultilevel*(graph: ptr igrapht; weights: ptr igraphvectort;
                                resolution: igraphrealt;
                                membership: ptr igraphvectorintt;
                                memberships: ptr igraphmatrixintt;
                                modularity: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_community_multilevel".}
proc igraphcommunityleiden*(graph: ptr igrapht; edgeweights: ptr igraphvectort;
                            nodeweights: ptr igraphvectort;
                            resolutionparameter: igraphrealt; beta: igraphrealt;
                            start: igraphboolt; niterations: igraphintegert;
                            membership: ptr igraphvectorintt;
                            nbclusters: ptr igraphintegert;
                            quality: ptr igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_community_leiden".}
proc igraphcomparecommunities*(comm1: ptr igraphvectorintt;
                               comm2: ptr igraphvectorintt;
                               result: ptr igraphrealt;
                               methodarg: igraphcommunitycomparisont): igrapherrort {.
    cdecl, importc: "igraph_compare_communities".}
proc igraphsplitjoindistance*(comm1: ptr igraphvectorintt;
                              comm2: ptr igraphvectorintt;
                              distance12: ptr igraphintegert;
                              distance21: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_split_join_distance".}
proc igraphattributecombinationinit*(comb: ptr igraphattributecombinationt): igrapherrort {.
    cdecl, importc: "igraph_attribute_combination_init".}
proc igraphattributecombination*(comb: ptr igraphattributecombinationt): igrapherrort {.
    cdecl, varargs, importc: "igraph_attribute_combination".}
proc igraphattributecombinationdestroy*(comb: ptr igraphattributecombinationt): void {.
    cdecl, importc: "igraph_attribute_combination_destroy".}
proc igraphattributecombinationadd*(comb: ptr igraphattributecombinationt;
                                    name: cstring;
                                    typearg: igraphattributecombinationtypet;
                                    funcarg: igraphfunctionpointert): igrapherrort {.
    cdecl, importc: "igraph_attribute_combination_add".}
proc igraphattributecombinationremove*(comb: ptr igraphattributecombinationt;
                                       name: cstring): igrapherrort {.cdecl,
    importc: "igraph_attribute_combination_remove".}
proc igraphattributecombinationquery*(comb: ptr igraphattributecombinationt;
                                      name: cstring; typearg: ptr igraphattributecombinationtypet;
                                      funcarg: igraphfunctionpointert): igrapherrort {.
    cdecl, importc: "igraph_attribute_combination_query".}
proc igraphisetattributetable*(table: ptr igraphattributetablet): ptr igraphattributetablet {.
    cdecl, importc: "igraph_i_set_attribute_table".}
proc igraphsetattributetable*(table: ptr igraphattributetablet): ptr igraphattributetablet {.
    cdecl, importc: "igraph_set_attribute_table".}
proc igraphhasattributetable*(): igraphboolt {.cdecl,
    importc: "igraph_has_attribute_table".}
var igraphcattributetable* {.importc: "igraph_cattribute_table".}: igraphattributetablet
proc igraphcattributegan*(graph: ptr igrapht; name: cstring): igraphrealt {.
    cdecl, importc: "igraph_cattribute_GAN".}
proc igraphcattributegab*(graph: ptr igrapht; name: cstring): igraphboolt {.
    cdecl, importc: "igraph_cattribute_GAB".}
proc igraphcattributegas*(graph: ptr igrapht; name: cstring): cstring {.cdecl,
    importc: "igraph_cattribute_GAS".}
proc igraphcattributevan*(graph: ptr igrapht; name: cstring; vid: igraphintegert): igraphrealt {.
    cdecl, importc: "igraph_cattribute_VAN".}
proc igraphcattributevab*(graph: ptr igrapht; name: cstring; vid: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_cattribute_VAB".}
proc igraphcattributevas*(graph: ptr igrapht; name: cstring; vid: igraphintegert): cstring {.
    cdecl, importc: "igraph_cattribute_VAS".}
proc igraphcattributeean*(graph: ptr igrapht; name: cstring; eid: igraphintegert): igraphrealt {.
    cdecl, importc: "igraph_cattribute_EAN".}
proc igraphcattributeeab*(graph: ptr igrapht; name: cstring; eid: igraphintegert): igraphboolt {.
    cdecl, importc: "igraph_cattribute_EAB".}
proc igraphcattributeeas*(graph: ptr igrapht; name: cstring; eid: igraphintegert): cstring {.
    cdecl, importc: "igraph_cattribute_EAS".}
proc igraphcattributevanv*(graph: ptr igrapht; name: cstring; vids: igraphvst;
                           result: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_VANV".}
proc igraphcattributeeanv*(graph: ptr igrapht; name: cstring; eids: igraphest;
                           result: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_EANV".}
proc igraphcattributevasv*(graph: ptr igrapht; name: cstring; vids: igraphvst;
                           result: ptr igraphstrvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_VASV".}
proc igraphcattributeeasv*(graph: ptr igrapht; name: cstring; eids: igraphest;
                           result: ptr igraphstrvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_EASV".}
proc igraphcattributevabv*(graph: ptr igrapht; name: cstring; vids: igraphvst;
                           result: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_cattribute_VABV".}
proc igraphcattributeeabv*(graph: ptr igrapht; name: cstring; eids: igraphest;
                           result: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_cattribute_EABV".}
proc igraphcattributelist*(graph: ptr igrapht; gnames: ptr igraphstrvectort;
                           gtypes: ptr igraphvectorintt;
                           vnames: ptr igraphstrvectort;
                           vtypes: ptr igraphvectorintt;
                           enames: ptr igraphstrvectort;
                           etypes: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_cattribute_list".}
proc igraphcattributehasattr*(graph: ptr igrapht;
                              typearg: igraphattributeelemtypet; name: cstring): igraphboolt {.
    cdecl, importc: "igraph_cattribute_has_attr".}
proc igraphcattributeganset*(graph: ptr igrapht; name: cstring;
                             value: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_cattribute_GAN_set".}
proc igraphcattributegabset*(graph: ptr igrapht; name: cstring;
                             value: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_cattribute_GAB_set".}
proc igraphcattributegasset*(graph: ptr igrapht; name: cstring; value: cstring): igrapherrort {.
    cdecl, importc: "igraph_cattribute_GAS_set".}
proc igraphcattributevanset*(graph: ptr igrapht; name: cstring;
                             vid: igraphintegert; value: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_cattribute_VAN_set".}
proc igraphcattributevabset*(graph: ptr igrapht; name: cstring;
                             vid: igraphintegert; value: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_cattribute_VAB_set".}
proc igraphcattributevasset*(graph: ptr igrapht; name: cstring;
                             vid: igraphintegert; value: cstring): igrapherrort {.
    cdecl, importc: "igraph_cattribute_VAS_set".}
proc igraphcattributeeanset*(graph: ptr igrapht; name: cstring;
                             eid: igraphintegert; value: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_cattribute_EAN_set".}
proc igraphcattributeeabset*(graph: ptr igrapht; name: cstring;
                             eid: igraphintegert; value: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_cattribute_EAB_set".}
proc igraphcattributeeasset*(graph: ptr igrapht; name: cstring;
                             eid: igraphintegert; value: cstring): igrapherrort {.
    cdecl, importc: "igraph_cattribute_EAS_set".}
proc igraphcattributevansetv*(graph: ptr igrapht; name: cstring;
                              v: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_VAN_setv".}
proc igraphcattributevabsetv*(graph: ptr igrapht; name: cstring;
                              v: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_cattribute_VAB_setv".}
proc igraphcattributevassetv*(graph: ptr igrapht; name: cstring;
                              sv: ptr igraphstrvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_VAS_setv".}
proc igraphcattributeeansetv*(graph: ptr igrapht; name: cstring;
                              v: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_EAN_setv".}
proc igraphcattributeeabsetv*(graph: ptr igrapht; name: cstring;
                              v: ptr igraphvectorboolt): igrapherrort {.cdecl,
    importc: "igraph_cattribute_EAB_setv".}
proc igraphcattributeeassetv*(graph: ptr igrapht; name: cstring;
                              sv: ptr igraphstrvectort): igrapherrort {.cdecl,
    importc: "igraph_cattribute_EAS_setv".}
proc igraphcattributeremoveg*(graph: ptr igrapht; name: cstring): void {.cdecl,
    importc: "igraph_cattribute_remove_g".}
proc igraphcattributeremovev*(graph: ptr igrapht; name: cstring): void {.cdecl,
    importc: "igraph_cattribute_remove_v".}
proc igraphcattributeremovee*(graph: ptr igrapht; name: cstring): void {.cdecl,
    importc: "igraph_cattribute_remove_e".}
proc igraphcattributeremoveall*(graph: ptr igrapht; g: igraphboolt;
                                v: igraphboolt; e: igraphboolt): void {.cdecl,
    importc: "igraph_cattribute_remove_all".}
proc igraphgetadjacency*(graph: ptr igrapht; res: ptr igraphmatrixt;
                         typearg: igraphgetadjacencyt;
                         weights: ptr igraphvectort; loops: igraphloopst): igrapherrort {.
    cdecl, importc: "igraph_get_adjacency".}
proc igraphgetadjacencysparse*(graph: ptr igrapht; res: ptr igraphsparsematt;
                               typearg: igraphgetadjacencyt;
                               weights: ptr igraphvectort; loops: igraphloopst): igrapherrort {.
    cdecl, importc: "igraph_get_adjacency_sparse".}
proc igraphgetstochastic*(graph: ptr igrapht; matrix: ptr igraphmatrixt;
                          columnwise: igraphboolt; weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_get_stochastic".}
proc igraphgetstochasticsparse*(graph: ptr igrapht; res: ptr igraphsparsematt;
                                columnwise: igraphboolt;
                                weights: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_get_stochastic_sparse".}
proc igraphgetsparsemat*(graph: ptr igrapht; res: ptr igraphsparsematt): igrapherrort {.
    cdecl, importc: "igraph_get_sparsemat".}
proc igraphgetstochasticsparsemat*(graph: ptr igrapht;
                                   res: ptr igraphsparsematt;
                                   columnwise: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_get_stochastic_sparsemat".}
proc igraphgetedgelist*(graph: ptr igrapht; res: ptr igraphvectorintt;
                        bycol: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_get_edgelist".}
proc igraphtodirected*(graph: ptr igrapht; flags: igraphtodirectedt): igrapherrort {.
    cdecl, importc: "igraph_to_directed".}
proc igraphtoundirected*(graph: ptr igrapht; mode: igraphtoundirectedt;
                         edgecomb: ptr igraphattributecombinationt): igrapherrort {.
    cdecl, importc: "igraph_to_undirected".}
proc igraphtoprufer*(graph: ptr igrapht; prufer: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_to_prufer".}
proc igraphreadgraphedgelist*(graph: ptr igrapht; instream: ptr File;
                              n: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_read_graph_edgelist".}
proc igraphreadgraphncol*(graph: ptr igrapht; instream: ptr File;
                          predefnames: ptr igraphstrvectort; names: igraphboolt;
                          weights: igraphaddweightst; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_read_graph_ncol".}
proc igraphreadgraphlgl*(graph: ptr igrapht; instream: ptr File;
                         names: igraphboolt; weights: igraphaddweightst;
                         directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_read_graph_lgl".}
proc igraphreadgraphpajek*(graph: ptr igrapht; instream: ptr File): igrapherrort {.
    cdecl, importc: "igraph_read_graph_pajek".}
proc igraphreadgraphgraphml*(graph: ptr igrapht; instream: ptr File;
                             index: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_read_graph_graphml".}
proc igraphreadgraphdimacs*(graph: ptr igrapht; instream: ptr File;
                            problem: ptr igraphstrvectort;
                            label: ptr igraphvectorintt;
                            source: ptr igraphintegert;
                            target: ptr igraphintegert;
                            capacity: ptr igraphvectort; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_read_graph_dimacs".}
proc igraphreadgraphdimacsflow*(graph: ptr igrapht; instream: ptr File;
                                problem: ptr igraphstrvectort;
                                label: ptr igraphvectorintt;
                                source: ptr igraphintegert;
                                target: ptr igraphintegert;
                                capacity: ptr igraphvectort;
                                directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_read_graph_dimacs_flow".}
proc igraphreadgraphgraphdb*(graph: ptr igrapht; instream: ptr File;
                             directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_read_graph_graphdb".}
proc igraphreadgraphgml*(graph: ptr igrapht; instream: ptr File): igrapherrort {.
    cdecl, importc: "igraph_read_graph_gml".}
proc igraphreadgraphdl*(graph: ptr igrapht; instream: ptr File;
                        directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_read_graph_dl".}
proc igraphwritegraphedgelist*(graph: ptr igrapht; outstream: ptr File): igrapherrort {.
    cdecl, importc: "igraph_write_graph_edgelist".}
proc igraphwritegraphncol*(graph: ptr igrapht; outstream: ptr File;
                           names: cstring; weights: cstring): igrapherrort {.
    cdecl, importc: "igraph_write_graph_ncol".}
proc igraphwritegraphlgl*(graph: ptr igrapht; outstream: ptr File;
                          names: cstring; weights: cstring;
                          isolates: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_write_graph_lgl".}
proc igraphwritegraphgraphml*(graph: ptr igrapht; outstream: ptr File;
                              prefixattr: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_write_graph_graphml".}
proc igraphwritegraphpajek*(graph: ptr igrapht; outstream: ptr File): igrapherrort {.
    cdecl, importc: "igraph_write_graph_pajek".}
proc igraphwritegraphdimacs*(graph: ptr igrapht; outstream: ptr File;
                             source: igraphintegert; target: igraphintegert;
                             capacity: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_write_graph_dimacs".}
proc igraphwritegraphdimacsflow*(graph: ptr igrapht; outstream: ptr File;
                                 source: igraphintegert; target: igraphintegert;
                                 capacity: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_write_graph_dimacs_flow".}
proc igraphwritegraphgml*(graph: ptr igrapht; outstream: ptr File;
                          options: igraphwritegmlswt; id: ptr igraphvectort;
                          creator: cstring): igrapherrort {.cdecl,
    importc: "igraph_write_graph_gml".}
proc igraphwritegraphdot*(graph: ptr igrapht; outstream: ptr File): igrapherrort {.
    cdecl, importc: "igraph_write_graph_dot".}
proc igraphwritegraphleda*(graph: ptr igrapht; outstream: ptr File;
                           vertexattrname: cstring; edgeattrname: cstring): igrapherrort {.
    cdecl, importc: "igraph_write_graph_leda".}
proc igraphentersafelocale*(loc: ptr igraphsafelocalet): igrapherrort {.cdecl,
    importc: "igraph_enter_safelocale".}
proc igraphexitsafelocale*(loc: ptr igraphsafelocalet): void {.cdecl,
    importc: "igraph_exit_safelocale".}
proc igraphmotifsrandesu*(graph: ptr igrapht; hist: ptr igraphvectort;
                          size: igraphintegert; cutprob: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_motifs_randesu".}
proc igraphmotifsrandesucallback*(graph: ptr igrapht; size: igraphintegert;
                                  cutprob: ptr igraphvectort;
                                  callback: igraphmotifshandlert; extra: pointer): igrapherrort {.
    cdecl, importc: "igraph_motifs_randesu_callback".}
proc igraphmotifsrandesuestimate*(graph: ptr igrapht; est: ptr igraphintegert;
                                  size: igraphintegert;
                                  cutprob: ptr igraphvectort;
                                  samplesize: igraphintegert;
                                  sample: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_motifs_randesu_estimate".}
proc igraphmotifsrandesuno*(graph: ptr igrapht; no: ptr igraphintegert;
                            size: igraphintegert; cutprob: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_motifs_randesu_no".}
proc igraphdyadcensus*(graph: ptr igrapht; mut: ptr igraphrealt;
                       asym: ptr igraphrealt; null: ptr igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_dyad_census".}
proc igraphtriadcensus*(igraph: ptr igrapht; res: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_triad_census".}
proc igraphadjacenttriangles*(graph: ptr igrapht; res: ptr igraphvectort;
                              vids: igraphvst): igrapherrort {.cdecl,
    importc: "igraph_adjacent_triangles".}
proc igraphlisttriangles*(graph: ptr igrapht; res: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_list_triangles".}
proc igraphaddedge*(graph: ptr igrapht; fromarg: igraphintegert;
                    to: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_add_edge".}
proc igraphdisjointunion*(res: ptr igrapht; left: ptr igrapht;
                          right: ptr igrapht): igrapherrort {.cdecl,
    importc: "igraph_disjoint_union".}
proc igraphdisjointunionmany*(res: ptr igrapht; graphs: ptr igraphvectorptrt): igrapherrort {.
    cdecl, importc: "igraph_disjoint_union_many".}
proc igraphunion*(res: ptr igrapht; left: ptr igrapht; right: ptr igrapht;
                  edgemap1: ptr igraphvectorintt; edgemap2: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_union".}
proc igraphunionmany*(res: ptr igrapht; graphs: ptr igraphvectorptrt;
                      edgemaps: ptr igraphvectorintlistt): igrapherrort {.cdecl,
    importc: "igraph_union_many".}
proc igraphjoin*(res: ptr igrapht; left: ptr igrapht; right: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_join".}
proc igraphintersection*(res: ptr igrapht; left: ptr igrapht;
                         right: ptr igrapht; edgemap1: ptr igraphvectorintt;
                         edgemap2: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_intersection".}
proc igraphintersectionmany*(res: ptr igrapht; graphs: ptr igraphvectorptrt;
                             edgemaps: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_intersection_many".}
proc igraphdifference*(res: ptr igrapht; orig: ptr igrapht; sub: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_difference".}
proc igraphcomplementer*(res: ptr igrapht; graph: ptr igrapht;
                         loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_complementer".}
proc igraphcompose*(res: ptr igrapht; g1: ptr igrapht; g2: ptr igrapht;
                    edgemap1: ptr igraphvectorintt;
                    edgemap2: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_compose".}
proc igraphcontractvertices*(graph: ptr igrapht; mapping: ptr igraphvectorintt;
                             vertexcomb: ptr igraphattributecombinationt): igrapherrort {.
    cdecl, importc: "igraph_contract_vertices".}
proc igraphpermutevertices*(graph: ptr igrapht; res: ptr igrapht;
                            permutation: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_permute_vertices".}
proc igraphconnectneighborhood*(graph: ptr igrapht; order: igraphintegert;
                                mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_connect_neighborhood".}
proc igraphgraphpower*(graph: ptr igrapht; res: ptr igrapht;
                       order: igraphintegert; directed: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_graph_power".}
proc igraphrewire*(graph: ptr igrapht; n: igraphintegert; mode: igraphrewiringt): igrapherrort {.
    cdecl, importc: "igraph_rewire".}
proc igraphsimplify*(graph: ptr igrapht; multiple: igraphboolt;
                     loops: igraphboolt;
                     edgecomb: ptr igraphattributecombinationt): igrapherrort {.
    cdecl, importc: "igraph_simplify".}
proc igraphinducedsubgraphmap*(graph: ptr igrapht; res: ptr igrapht;
                               vids: igraphvst;
                               impl: igraphsubgraphimplementationt;
                               map: ptr igraphvectorintt;
                               invmap: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_induced_subgraph_map".}
proc igraphinducedsubgraph*(graph: ptr igrapht; res: ptr igrapht;
                            vids: igraphvst; impl: igraphsubgraphimplementationt): igrapherrort {.
    cdecl, importc: "igraph_induced_subgraph".}
proc igraphinducedsubgraphedges*(graph: ptr igrapht; vids: igraphvst;
                                 edges: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_induced_subgraph_edges".}
proc igraphsubgraphfromedges*(graph: ptr igrapht; res: ptr igrapht;
                              eids: igraphest; deletevertices: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_subgraph_from_edges".}
proc igraphreverseedges*(graph: ptr igrapht; eids: igraphest): igrapherrort {.
    cdecl, importc: "igraph_reverse_edges".}
proc igraphsubgraphedges*(graph: ptr igrapht; res: ptr igrapht; eids: igraphest;
                          deletevertices: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_subgraph_edges".}
proc igraphmaxflow*(graph: ptr igrapht; value: ptr igraphrealt;
                    flow: ptr igraphvectort; cut: ptr igraphvectorintt;
                    partition: ptr igraphvectorintt;
                    partition2: ptr igraphvectorintt; source: igraphintegert;
                    target: igraphintegert; capacity: ptr igraphvectort;
                    stats: ptr igraphmaxflowstatst): igrapherrort {.cdecl,
    importc: "igraph_maxflow".}
proc igraphmaxflowvalue*(graph: ptr igrapht; value: ptr igraphrealt;
                         source: igraphintegert; target: igraphintegert;
                         capacity: ptr igraphvectort;
                         stats: ptr igraphmaxflowstatst): igrapherrort {.cdecl,
    importc: "igraph_maxflow_value".}
proc igraphstmincut*(graph: ptr igrapht; value: ptr igraphrealt;
                     cut: ptr igraphvectorintt; partition: ptr igraphvectorintt;
                     partition2: ptr igraphvectorintt; source: igraphintegert;
                     target: igraphintegert; capacity: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_st_mincut".}
proc igraphstmincutvalue*(graph: ptr igrapht; res: ptr igraphrealt;
                          source: igraphintegert; target: igraphintegert;
                          capacity: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_st_mincut_value".}
proc igraphmincutvalue*(graph: ptr igrapht; res: ptr igraphrealt;
                        capacity: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_mincut_value".}
proc igraphmincut*(graph: ptr igrapht; value: ptr igraphrealt;
                   partition: ptr igraphvectorintt;
                   partition2: ptr igraphvectorintt; cut: ptr igraphvectorintt;
                   capacity: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_mincut".}
proc igraphstvertexconnectivity*(graph: ptr igrapht; res: ptr igraphintegert;
                                 source: igraphintegert; target: igraphintegert;
                                 neighbors: igraphvconnneit): igrapherrort {.
    cdecl, importc: "igraph_st_vertex_connectivity".}
proc igraphvertexconnectivity*(graph: ptr igrapht; res: ptr igraphintegert;
                               checks: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_vertex_connectivity".}
proc igraphstedgeconnectivity*(graph: ptr igrapht; res: ptr igraphintegert;
                               source: igraphintegert; target: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_st_edge_connectivity".}
proc igraphedgeconnectivity*(graph: ptr igrapht; res: ptr igraphintegert;
                             checks: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_edge_connectivity".}
proc igraphedgedisjointpaths*(graph: ptr igrapht; res: ptr igraphintegert;
                              source: igraphintegert; target: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_edge_disjoint_paths".}
proc igraphvertexdisjointpaths*(graph: ptr igrapht; res: ptr igraphintegert;
                                source: igraphintegert; target: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_vertex_disjoint_paths".}
proc igraphadhesion*(graph: ptr igrapht; res: ptr igraphintegert;
                     checks: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_adhesion".}
proc igraphcohesion*(graph: ptr igrapht; res: ptr igraphintegert;
                     checks: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_cohesion".}
proc igrapheventarjanreduction*(graph: ptr igrapht; graphbar: ptr igrapht;
                                capacity: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_even_tarjan_reduction".}
proc igraphresidualgraph*(graph: ptr igrapht; capacity: ptr igraphvectort;
                          residual: ptr igrapht;
                          residualcapacity: ptr igraphvectort;
                          flow: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_residual_graph".}
proc igraphreverseresidualgraph*(graph: ptr igrapht;
                                 capacity: ptr igraphvectort;
                                 residual: ptr igrapht; flow: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_reverse_residual_graph".}
proc igraphdominatortree*(graph: ptr igrapht; root: igraphintegert;
                          dom: ptr igraphvectorintt; domtree: ptr igrapht;
                          leftout: ptr igraphvectorintt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_dominator_tree".}
proc igraphallstcuts*(graph: ptr igrapht; cuts: ptr igraphvectorintlistt;
                      partition1s: ptr igraphvectorintlistt;
                      source: igraphintegert; target: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_all_st_cuts".}
proc igraphallstmincuts*(graph: ptr igrapht; value: ptr igraphrealt;
                         cuts: ptr igraphvectorintlistt;
                         partition1s: ptr igraphvectorintlistt;
                         source: igraphintegert; target: igraphintegert;
                         capacity: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_all_st_mincuts".}
proc igraphgomoryhutree*(graph: ptr igrapht; tree: ptr igrapht;
                         flows: ptr igraphvectort; capacity: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_gomory_hu_tree".}
proc igraphrunningmean*(data: ptr igraphvectort; res: ptr igraphvectort;
                        binwidth: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_running_mean".}
proc igraphrandomsample*(res: ptr igraphvectorintt; l: igraphintegert;
                         h: igraphintegert; length: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_random_sample".}
proc igraphconvexhull*(data: ptr igraphmatrixt; resverts: ptr igraphvectorintt;
                       rescoords: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_convex_hull".}
proc igraphalmostequals*(a: cdouble; b: cdouble; eps: cdouble): igraphboolt {.
    cdecl, importc: "igraph_almost_equals".}
proc igraphcmpepsilon*(a: cdouble; b: cdouble; eps: cdouble): cint {.cdecl,
    importc: "igraph_cmp_epsilon".}
proc igraphpowerlawfit*(vector: ptr igraphvectort;
                        result: ptr igraphplfitresultt; xmin: igraphrealt;
                        forcecontinuous: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_power_law_fit".}
proc igraphplfitresultcalculatepvalue*(model: ptr igraphplfitresultt;
                                       result: ptr igraphrealt;
                                       precision: igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_plfit_result_calculate_p_value".}
proc igraphzeroin*(ax: ptr igraphrealt; bx: ptr igraphrealt; f: proc (
    a0: igraphrealt; a1: pointer): igraphrealt {.cdecl.}; info: pointer;
                   Tol: ptr igraphrealt; Maxit: ptr cint; res: ptr igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_zeroin".}
proc igraphcocitation*(graph: ptr igrapht; res: ptr igraphmatrixt;
                       vids: igraphvst): igrapherrort {.cdecl,
    importc: "igraph_cocitation".}
proc igraphbibcoupling*(graph: ptr igrapht; res: ptr igraphmatrixt;
                        vids: igraphvst): igrapherrort {.cdecl,
    importc: "igraph_bibcoupling".}
proc igraphsimilarityjaccard*(graph: ptr igrapht; res: ptr igraphmatrixt;
                              vids: igraphvst; mode: igraphneimodet;
                              loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_similarity_jaccard".}
proc igraphsimilarityjaccardpairs*(graph: ptr igrapht; res: ptr igraphvectort;
                                   pairs: ptr igraphvectorintt;
                                   mode: igraphneimodet; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_similarity_jaccard_pairs".}
proc igraphsimilarityjaccardes*(graph: ptr igrapht; res: ptr igraphvectort;
                                es: igraphest; mode: igraphneimodet;
                                loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_similarity_jaccard_es".}
proc igraphsimilaritydice*(graph: ptr igrapht; res: ptr igraphmatrixt;
                           vids: igraphvst; mode: igraphneimodet;
                           loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_similarity_dice".}
proc igraphsimilaritydicepairs*(graph: ptr igrapht; res: ptr igraphvectort;
                                pairs: ptr igraphvectorintt;
                                mode: igraphneimodet; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_similarity_dice_pairs".}
proc igraphsimilaritydicees*(graph: ptr igrapht; res: ptr igraphvectort;
                             es: igraphest; mode: igraphneimodet;
                             loops: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_similarity_dice_es".}
proc igraphsimilarityinverselogweighted*(graph: ptr igrapht;
    res: ptr igraphmatrixt; vids: igraphvst; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_similarity_inverse_log_weighted".}
proc igraphadjlistinit*(graph: ptr igrapht; al: ptr igraphadjlistt;
                        mode: igraphneimodet; loops: igraphloopst;
                        multiple: igraphmultiplet): igrapherrort {.cdecl,
    importc: "igraph_adjlist_init".}
proc igraphadjlistinitempty*(al: ptr igraphadjlistt; noofnodes: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_adjlist_init_empty".}
proc igraphadjlistsize*(al: ptr igraphadjlistt): igraphintegert {.cdecl,
    importc: "igraph_adjlist_size".}
proc igraphadjlistinitcomplementer*(graph: ptr igrapht; al: ptr igraphadjlistt;
                                    mode: igraphneimodet; loops: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_adjlist_init_complementer".}
proc igraphadjlistinitfrominclist*(graph: ptr igrapht; al: ptr igraphadjlistt;
                                   il: ptr igraphinclistt): igrapherrort {.
    cdecl, importc: "igraph_adjlist_init_from_inclist".}
proc igraphadjlistdestroy*(al: ptr igraphadjlistt): void {.cdecl,
    importc: "igraph_adjlist_destroy".}
proc igraphadjlistclear*(al: ptr igraphadjlistt): void {.cdecl,
    importc: "igraph_adjlist_clear".}
proc igraphadjlistsort*(al: ptr igraphadjlistt): void {.cdecl,
    importc: "igraph_adjlist_sort".}
proc igraphadjlistsimplify*(al: ptr igraphadjlistt): igrapherrort {.cdecl,
    importc: "igraph_adjlist_simplify".}
proc igraphadjlistprint*(al: ptr igraphadjlistt): igrapherrort {.cdecl,
    importc: "igraph_adjlist_print".}
proc igraphadjlistfprint*(al: ptr igraphadjlistt; outfile: ptr File): igrapherrort {.
    cdecl, importc: "igraph_adjlist_fprint".}
proc igraphadjlisthasedge*(al: ptr igraphadjlistt; fromarg: igraphintegert;
                           to: igraphintegert; directed: igraphboolt): igraphboolt {.
    cdecl, importc: "igraph_adjlist_has_edge".}
proc igraphadjlistreplaceedge*(al: ptr igraphadjlistt; fromarg: igraphintegert;
                               oldto: igraphintegert; newto: igraphintegert;
                               directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_adjlist_replace_edge".}
proc igraphadjlist*(graph: ptr igrapht; adjlist: ptr igraphadjlistt;
                    mode: igraphneimodet; duplicate: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_adjlist".}
proc igraphinclistinit*(graph: ptr igrapht; il: ptr igraphinclistt;
                        mode: igraphneimodet; loops: igraphloopst): igrapherrort {.
    cdecl, importc: "igraph_inclist_init".}
proc igraphinclistinitempty*(il: ptr igraphinclistt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_inclist_init_empty".}
proc igraphinclistsize*(al: ptr igraphinclistt): igraphintegert {.cdecl,
    importc: "igraph_inclist_size".}
proc igraphinclistdestroy*(il: ptr igraphinclistt): void {.cdecl,
    importc: "igraph_inclist_destroy".}
proc igraphinclistclear*(il: ptr igraphinclistt): void {.cdecl,
    importc: "igraph_inclist_clear".}
proc igraphinclistprint*(il: ptr igraphinclistt): igrapherrort {.cdecl,
    importc: "igraph_inclist_print".}
proc igraphinclistfprint*(il: ptr igraphinclistt; outfile: ptr File): igrapherrort {.
    cdecl, importc: "igraph_inclist_fprint".}
proc igraphlazyadjlistinit*(graph: ptr igrapht; al: ptr igraphlazyadjlistt;
                            mode: igraphneimodet; loops: igraphloopst;
                            multiple: igraphmultiplet): igrapherrort {.cdecl,
    importc: "igraph_lazy_adjlist_init".}
proc igraphlazyadjlistdestroy*(al: ptr igraphlazyadjlistt): void {.cdecl,
    importc: "igraph_lazy_adjlist_destroy".}
proc igraphlazyadjlistclear*(al: ptr igraphlazyadjlistt): void {.cdecl,
    importc: "igraph_lazy_adjlist_clear".}
proc igraphlazyadjlistsize*(al: ptr igraphlazyadjlistt): igraphintegert {.cdecl,
    importc: "igraph_lazy_adjlist_size".}
proc igraphilazyadjlistgetreal*(al: ptr igraphlazyadjlistt; no: igraphintegert): ptr igraphvectorintt {.
    cdecl, importc: "igraph_i_lazy_adjlist_get_real".}
proc igraphlazyinclistinit*(graph: ptr igrapht; il: ptr igraphlazyinclistt;
                            mode: igraphneimodet; loops: igraphloopst): igrapherrort {.
    cdecl, importc: "igraph_lazy_inclist_init".}
proc igraphlazyinclistdestroy*(il: ptr igraphlazyinclistt): void {.cdecl,
    importc: "igraph_lazy_inclist_destroy".}
proc igraphlazyinclistclear*(il: ptr igraphlazyinclistt): void {.cdecl,
    importc: "igraph_lazy_inclist_clear".}
proc igraphlazyinclistsize*(il: ptr igraphlazyinclistt): igraphintegert {.cdecl,
    importc: "igraph_lazy_inclist_size".}
proc igraphilazyinclistgetreal*(il: ptr igraphlazyinclistt; no: igraphintegert): ptr igraphvectorintt {.
    cdecl, importc: "igraph_i_lazy_inclist_get_real".}
proc igraphblasdgemv*(transpose: igraphboolt; alpha: igraphrealt;
                      a: ptr igraphmatrixt; x: ptr igraphvectort;
                      beta: igraphrealt; y: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_blas_dgemv".}
proc igraphblasdgemm*(transposea: igraphboolt; transposeb: igraphboolt;
                      alpha: igraphrealt; a: ptr igraphmatrixt;
                      b: ptr igraphmatrixt; beta: igraphrealt;
                      c: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_blas_dgemm".}
proc igraphblasdgemvarray*(transpose: igraphboolt; alpha: igraphrealt;
                           a: ptr igraphmatrixt; x: ptr igraphrealt;
                           beta: igraphrealt; y: ptr igraphrealt): igrapherrort {.
    cdecl, importc: "igraph_blas_dgemv_array".}
proc igraphblasdnrm2*(v: ptr igraphvectort): igraphrealt {.cdecl,
    importc: "igraph_blas_dnrm2".}
proc igraphblasddot*(v1: ptr igraphvectort; v2: ptr igraphvectort;
                     res: ptr igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_blas_ddot".}
proc igraphlapackdgetrf*(a: ptr igraphmatrixt; ipiv: ptr igraphvectorintt;
                         info: ptr cint): igrapherrort {.cdecl,
    importc: "igraph_lapack_dgetrf".}
proc igraphlapackdgetrs*(transpose: igraphboolt; a: ptr igraphmatrixt;
                         ipiv: ptr igraphvectorintt; b: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_lapack_dgetrs".}
proc igraphlapackdgesv*(a: ptr igraphmatrixt; ipiv: ptr igraphvectorintt;
                        b: ptr igraphmatrixt; info: ptr cint): igrapherrort {.
    cdecl, importc: "igraph_lapack_dgesv".}
proc igraphlapackdsyevr*(A: ptr igraphmatrixt; which: igraphlapackdsyevwhicht;
                         vl: igraphrealt; vu: igraphrealt; vestimate: cint;
                         il: cint; iu: cint; abstol: igraphrealt;
                         values: ptr igraphvectort; vectors: ptr igraphmatrixt;
                         support: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_lapack_dsyevr".}
proc igraphlapackdgeev*(A: ptr igraphmatrixt; valuesreal: ptr igraphvectort;
                        valuesimag: ptr igraphvectort;
                        vectorsleft: ptr igraphmatrixt;
                        vectorsright: ptr igraphmatrixt; info: ptr cint): igrapherrort {.
    cdecl, importc: "igraph_lapack_dgeev".}
proc igraphlapackdgeevx*(balance: igraphlapackdgeevxbalancet;
                         A: ptr igraphmatrixt; valuesreal: ptr igraphvectort;
                         valuesimag: ptr igraphvectort;
                         vectorsleft: ptr igraphmatrixt;
                         vectorsright: ptr igraphmatrixt; ilo: ptr cint;
                         ihi: ptr cint; scale: ptr igraphvectort;
                         abnrm: ptr igraphrealt; rconde: ptr igraphvectort;
                         rcondv: ptr igraphvectort; info: ptr cint): igrapherrort {.
    cdecl, importc: "igraph_lapack_dgeevx".}
proc igraphlapackdgehrd*(A: ptr igraphmatrixt; ilo: cint; ihi: cint;
                         result: ptr igraphmatrixt): igrapherrort {.cdecl,
    importc: "igraph_lapack_dgehrd".}
proc igraphassortativitynominal*(graph: ptr igrapht;
                                 types: ptr igraphvectorintt;
                                 res: ptr igraphrealt; directed: igraphboolt;
                                 normalized: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_assortativity_nominal".}
proc igraphassortativity*(graph: ptr igrapht; values: ptr igraphvectort;
                          valuesin: ptr igraphvectort; res: ptr igraphrealt;
                          directed: igraphboolt; normalized: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_assortativity".}
proc igraphassortativitydegree*(graph: ptr igrapht; res: ptr igraphrealt;
                                directed: igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_assortativity_degree".}
proc igraphjointdegreematrix*(graph: ptr igrapht; weights: ptr igraphvectort;
                              jdm: ptr igraphmatrixt; dout: igraphintegert;
                              din: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_joint_degree_matrix".}
proc igraphjointdegreedistribution*(graph: ptr igrapht;
                                    weights: ptr igraphvectort;
                                    p: ptr igraphmatrixt;
                                    frommode: igraphneimodet;
                                    tomode: igraphneimodet;
                                    directedneighbors: igraphboolt;
                                    normalized: igraphboolt;
                                    maxfromdegree: igraphintegert;
                                    maxtodegree: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_joint_degree_distribution".}
proc igraphjointtypedistribution*(graph: ptr igrapht;
                                  weights: ptr igraphvectort;
                                  p: ptr igraphmatrixt;
                                  fromtypes: ptr igraphvectorintt;
                                  totypes: ptr igraphvectorintt;
                                  directed: igraphboolt; normalized: igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_joint_type_distribution".}
proc igraphisseparator*(graph: ptr igrapht; candidate: igraphvst;
                        res: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_separator".}
proc igraphallminimalstseparators*(graph: ptr igrapht;
                                   separators: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_all_minimal_st_separators".}
proc igraphisminimalseparator*(graph: ptr igrapht; candidate: igraphvst;
                               res: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_minimal_separator".}
proc igraphminimumsizeseparators*(graph: ptr igrapht;
                                  separators: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_minimum_size_separators".}
proc igraphcohesiveblocks*(graph: ptr igrapht; blocks: ptr igraphvectorintlistt;
                           cohesion: ptr igraphvectorintt;
                           parent: ptr igraphvectorintt; blocktree: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_cohesive_blocks".}
proc igrapheigenmatrixsymmetric*(A: ptr igraphmatrixt; sa: ptr igraphsparsematt;
                                 fun: igrapharpackfunctiont; n: cint;
                                 extra: pointer;
                                 algorithm: igrapheigenalgorithmt;
                                 which: ptr igrapheigenwhicht;
                                 options: ptr igrapharpackoptionst;
                                 storage: ptr igrapharpackstoraget;
                                 values: ptr igraphvectort;
                                 vectors: ptr igraphmatrixt): igrapherrort {.
    cdecl, importc: "igraph_eigen_matrix_symmetric".}
proc igrapheigenmatrix*(A: ptr igraphmatrixt; sa: ptr igraphsparsematt;
                        fun: igrapharpackfunctiont; n: cint; extra: pointer;
                        algorithm: igrapheigenalgorithmt;
                        which: ptr igrapheigenwhicht;
                        options: ptr igrapharpackoptionst;
                        storage: ptr igrapharpackstoraget;
                        values: ptr igraphvectorcomplext;
                        vectors: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_eigen_matrix".}
proc igrapheigenadjacency*(graph: ptr igrapht; algorithm: igrapheigenalgorithmt;
                           which: ptr igrapheigenwhicht;
                           options: ptr igrapharpackoptionst;
                           storage: ptr igrapharpackstoraget;
                           values: ptr igraphvectort;
                           vectors: ptr igraphmatrixt;
                           cmplxvalues: ptr igraphvectorcomplext;
                           cmplxvectors: ptr igraphmatrixcomplext): igrapherrort {.
    cdecl, importc: "igraph_eigen_adjacency".}
proc igraphhrginit*(hrg: ptr igraphhrgt; n: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_hrg_init".}
proc igraphhrgdestroy*(hrg: ptr igraphhrgt): void {.cdecl,
    importc: "igraph_hrg_destroy".}
proc igraphhrgsize*(hrg: ptr igraphhrgt): igraphintegert {.cdecl,
    importc: "igraph_hrg_size".}
proc igraphhrgresize*(hrg: ptr igraphhrgt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_hrg_resize".}
proc igraphhrgfit*(graph: ptr igrapht; hrg: ptr igraphhrgt; start: igraphboolt;
                   steps: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_hrg_fit".}
proc igraphhrgsample*(hrg: ptr igraphhrgt; sample: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_hrg_sample".}
proc igraphhrgsamplemany*(hrg: ptr igraphhrgt; samples: ptr igraphgraphlistt;
                          numsamples: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_hrg_sample_many".}
proc igraphhrggame*(graph: ptr igrapht; hrg: ptr igraphhrgt): igrapherrort {.
    cdecl, importc: "igraph_hrg_game".}
proc igraphfromhrgdendrogram*(graph: ptr igrapht; hrg: ptr igraphhrgt;
                              prob: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_from_hrg_dendrogram".}
proc igraphhrgconsensus*(graph: ptr igrapht; parents: ptr igraphvectorintt;
                         weights: ptr igraphvectort; hrg: ptr igraphhrgt;
                         start: igraphboolt; numsamples: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_hrg_consensus".}
proc igraphhrgpredict*(graph: ptr igrapht; edges: ptr igraphvectorintt;
                       prob: ptr igraphvectort; hrg: ptr igraphhrgt;
                       start: igraphboolt; numsamples: igraphintegert;
                       numbins: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_hrg_predict".}
proc igraphhrgcreate*(hrg: ptr igraphhrgt; graph: ptr igrapht;
                      prob: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_hrg_create".}
proc igraphhrgdendrogram*(graph: ptr igrapht; hrg: ptr igraphhrgt): igrapherrort {.
    cdecl, importc: "igraph_hrg_dendrogram".}
proc igraphallowinterruption*(data: pointer): igrapherrort {.cdecl,
    importc: "igraph_allow_interruption".}
proc igraphsetinterruptionhandler*(newhandler: igraphinterruptionhandlert): igraphinterruptionhandlert {.
    cdecl, importc: "igraph_set_interruption_handler".}
proc igraphismatching*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                       matching: ptr igraphvectorintt; result: ptr igraphboolt): igrapherrort {.
    cdecl, importc: "igraph_is_matching".}
proc igraphismaximalmatching*(graph: ptr igrapht; types: ptr igraphvectorboolt;
                              matching: ptr igraphvectorintt;
                              result: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_maximal_matching".}
proc igraphmaximumbipartitematching*(graph: ptr igrapht;
                                     types: ptr igraphvectorboolt;
                                     matchingsize: ptr igraphintegert;
                                     matchingweight: ptr igraphrealt;
                                     matching: ptr igraphvectorintt;
                                     weights: ptr igraphvectort;
                                     eps: igraphrealt): igrapherrort {.cdecl,
    importc: "igraph_maximum_bipartite_matching".}
proc igraphadjacencyspectralembedding*(graph: ptr igrapht; no: igraphintegert;
                                       weights: ptr igraphvectort;
                                       which: igrapheigenwhichpositiont;
                                       scaled: igraphboolt;
                                       X: ptr igraphmatrixt;
                                       Y: ptr igraphmatrixt;
                                       D: ptr igraphvectort;
                                       cvec: ptr igraphvectort;
                                       options: ptr igrapharpackoptionst): igrapherrort {.
    cdecl, importc: "igraph_adjacency_spectral_embedding".}
proc igraphlaplacianspectralembedding*(graph: ptr igrapht; no: igraphintegert;
                                       weights: ptr igraphvectort;
                                       which: igrapheigenwhichpositiont; typearg: igraphlaplacianspectralembeddingtypet;
                                       scaled: igraphboolt;
                                       X: ptr igraphmatrixt;
                                       Y: ptr igraphmatrixt;
                                       D: ptr igraphvectort;
                                       options: ptr igrapharpackoptionst): igrapherrort {.
    cdecl, importc: "igraph_laplacian_spectral_embedding".}
proc igraphdimselect*(sv: ptr igraphvectort; dim: ptr igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_dim_select".}
proc igraphlocalscan0*(graph: ptr igrapht; res: ptr igraphvectort;
                       weights: ptr igraphvectort; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_local_scan_0".}
proc igraphlocalscan0them*(us: ptr igrapht; them: ptr igrapht;
                           res: ptr igraphvectort;
                           weightsthem: ptr igraphvectort; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_local_scan_0_them".}
proc igraphlocalscan1ecount*(graph: ptr igrapht; res: ptr igraphvectort;
                             weights: ptr igraphvectort; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_local_scan_1_ecount".}
proc igraphlocalscan1ecountthem*(us: ptr igrapht; them: ptr igrapht;
                                 res: ptr igraphvectort;
                                 weights: ptr igraphvectort;
                                 mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_local_scan_1_ecount_them".}
proc igraphlocalscankecount*(graph: ptr igrapht; k: igraphintegert;
                             res: ptr igraphvectort; weights: ptr igraphvectort;
                             mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_local_scan_k_ecount".}
proc igraphlocalscankecountthem*(us: ptr igrapht; them: ptr igrapht;
                                 k: igraphintegert; res: ptr igraphvectort;
                                 weightsthem: ptr igraphvectort;
                                 mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_local_scan_k_ecount_them".}
proc igraphlocalscanneighborhoodecount*(graph: ptr igrapht;
                                        res: ptr igraphvectort;
                                        weights: ptr igraphvectort;
                                        neighborhoods: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_local_scan_neighborhood_ecount".}
proc igraphlocalscansubsetecount*(graph: ptr igrapht; res: ptr igraphvectort;
                                  weights: ptr igraphvectort;
                                  neighborhoods: ptr igraphvectorintlistt): igrapherrort {.
    cdecl, importc: "igraph_local_scan_subset_ecount".}
proc igraphgraphletscandidatebasis*(graph: ptr igrapht;
                                    weights: ptr igraphvectort;
                                    cliques: ptr igraphvectorintlistt;
                                    thresholds: ptr igraphvectort): igrapherrort {.
    cdecl, importc: "igraph_graphlets_candidate_basis".}
proc igraphgraphletsproject*(graph: ptr igrapht; weights: ptr igraphvectort;
                             cliques: ptr igraphvectorintlistt;
                             Mu: ptr igraphvectort; startmu: igraphboolt;
                             niter: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_graphlets_project".}
proc igraphgraphlets*(graph: ptr igrapht; weights: ptr igraphvectort;
                      cliques: ptr igraphvectorintlistt; Mu: ptr igraphvectort;
                      niter: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_graphlets".}
proc igraphsirinit*(sir: ptr igraphsirt): igrapherrort {.cdecl,
    importc: "igraph_sir_init".}
proc igraphsirdestroy*(sir: ptr igraphsirt): void {.cdecl,
    importc: "igraph_sir_destroy".}
proc igraphsir*(graph: ptr igrapht; beta: igraphrealt; gamma: igraphrealt;
                nosim: igraphintegert; result: ptr igraphvectorptrt): igrapherrort {.
    cdecl, importc: "igraph_sir".}
proc igraphsolvelsap*(c: ptr igraphmatrixt; n: igraphintegert;
                      p: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_solve_lsap".}
proc igraphvertexcoloringgreedy*(graph: ptr igrapht;
                                 colors: ptr igraphvectorintt;
                                 heuristic: igraphcoloringgreedyt): igrapherrort {.
    cdecl, importc: "igraph_vertex_coloring_greedy".}
proc igraphiseulerian*(graph: ptr igrapht; haspath: ptr igraphboolt;
                       hascycle: ptr igraphboolt): igrapherrort {.cdecl,
    importc: "igraph_is_eulerian".}
proc igrapheulerianpath*(graph: ptr igrapht; edgeres: ptr igraphvectorintt;
                         vertexres: ptr igraphvectorintt): igrapherrort {.cdecl,
    importc: "igraph_eulerian_path".}
proc igrapheuleriancycle*(graph: ptr igrapht; edgeres: ptr igraphvectorintt;
                          vertexres: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_eulerian_cycle".}
proc igraphfundamentalcycles*(graph: ptr igrapht;
                              result: ptr igraphvectorintlistt;
                              startvid: igraphintegert;
                              bfscutoff: igraphintegert;
                              weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_fundamental_cycles".}
proc igraphminimumcyclebasis*(graph: ptr igrapht;
                              result: ptr igraphvectorintlistt;
                              bfscutoff: igraphintegert; complete: igraphboolt;
                              usecycleorder: igraphboolt;
                              weights: ptr igraphvectort): igrapherrort {.cdecl,
    importc: "igraph_minimum_cycle_basis".}
proc igraphbitsetlistinit*(v: ptr igraphbitsetlistt; size: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_init".}
proc igraphbitsetlistdestroy*(v: ptr igraphbitsetlistt): void {.cdecl,
    importc: "igraph_bitset_list_destroy".}
proc igraphbitsetlistgetptr*(v: ptr igraphbitsetlistt; pos: igraphintegert): ptr igraphbitsett {.
    cdecl, importc: "igraph_bitset_list_get_ptr".}
proc igraphbitsetlistset*(v: ptr igraphbitsetlistt; pos: igraphintegert;
                          e: ptr igraphbitsett): void {.cdecl,
    importc: "igraph_bitset_list_set".}
proc igraphbitsetlisttailptr*(v: ptr igraphbitsetlistt): ptr igraphbitsett {.
    cdecl, importc: "igraph_bitset_list_tail_ptr".}
proc igraphbitsetlistcapacity*(v: ptr igraphbitsetlistt): igraphintegert {.
    cdecl, importc: "igraph_bitset_list_capacity".}
proc igraphbitsetlistempty*(v: ptr igraphbitsetlistt): igraphboolt {.cdecl,
    importc: "igraph_bitset_list_empty".}
proc igraphbitsetlistsize*(v: ptr igraphbitsetlistt): igraphintegert {.cdecl,
    importc: "igraph_bitset_list_size".}
proc igraphbitsetlistclear*(v: ptr igraphbitsetlistt): void {.cdecl,
    importc: "igraph_bitset_list_clear".}
proc igraphbitsetlistreserve*(v: ptr igraphbitsetlistt; capacity: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_reserve".}
proc igraphbitsetlistresize*(v: ptr igraphbitsetlistt; newsize: igraphintegert): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_resize".}
proc igraphbitsetlistdiscard*(v: ptr igraphbitsetlistt; index: igraphintegert): void {.
    cdecl, importc: "igraph_bitset_list_discard".}
proc igraphbitsetlistdiscardback*(v: ptr igraphbitsetlistt): void {.cdecl,
    importc: "igraph_bitset_list_discard_back".}
proc igraphbitsetlistdiscardfast*(v: ptr igraphbitsetlistt;
                                  index: igraphintegert): void {.cdecl,
    importc: "igraph_bitset_list_discard_fast".}
proc igraphbitsetlistinsert*(v: ptr igraphbitsetlistt; pos: igraphintegert;
                             e: ptr igraphbitsett): igrapherrort {.cdecl,
    importc: "igraph_bitset_list_insert".}
proc igraphbitsetlistinsertcopy*(v: ptr igraphbitsetlistt; pos: igraphintegert;
                                 e: ptr igraphbitsett): igrapherrort {.cdecl,
    importc: "igraph_bitset_list_insert_copy".}
proc igraphbitsetlistinsertnew*(v: ptr igraphbitsetlistt; pos: igraphintegert;
                                result: ptr ptr igraphbitsett): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_insert_new".}
proc igraphbitsetlistpushback*(v: ptr igraphbitsetlistt; e: ptr igraphbitsett): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_push_back".}
proc igraphbitsetlistpushbackcopy*(v: ptr igraphbitsetlistt;
                                   e: ptr igraphbitsett): igrapherrort {.cdecl,
    importc: "igraph_bitset_list_push_back_copy".}
proc igraphbitsetlistpushbacknew*(v: ptr igraphbitsetlistt;
                                  result: ptr ptr igraphbitsett): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_push_back_new".}
proc igraphbitsetlistpopback*(v: ptr igraphbitsetlistt): igraphbitsett {.cdecl,
    importc: "igraph_bitset_list_pop_back".}
proc igraphbitsetlistremove*(v: ptr igraphbitsetlistt; index: igraphintegert;
                             e: ptr igraphbitsett): igrapherrort {.cdecl,
    importc: "igraph_bitset_list_remove".}
proc igraphbitsetlistremovefast*(v: ptr igraphbitsetlistt;
                                 index: igraphintegert; e: ptr igraphbitsett): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_remove_fast".}
proc igraphbitsetlistreplace*(v: ptr igraphbitsetlistt; pos: igraphintegert;
                              e: ptr igraphbitsett): void {.cdecl,
    importc: "igraph_bitset_list_replace".}
proc igraphbitsetlistremoveconsecutiveduplicates*(v: ptr igraphbitsetlistt; eq: proc (
    a0: ptr igraphbitsett; a1: ptr igraphbitsett): igraphboolt {.cdecl.}): void {.
    cdecl, importc: "igraph_bitset_list_remove_consecutive_duplicates".}
proc igraphbitsetlistpermute*(v: ptr igraphbitsetlistt;
                              index: ptr igraphvectorintt): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_permute".}
proc igraphbitsetlistreverse*(v: ptr igraphbitsetlistt): igrapherrort {.cdecl,
    importc: "igraph_bitset_list_reverse".}
proc igraphbitsetlistswap*(v1: ptr igraphbitsetlistt; v2: ptr igraphbitsetlistt): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_swap".}
proc igraphbitsetlistswapelements*(v: ptr igraphbitsetlistt; i: igraphintegert;
                                   j: igraphintegert): igrapherrort {.cdecl,
    importc: "igraph_bitset_list_swap_elements".}
proc igraphbitsetlistsort*(v: ptr igraphbitsetlistt; cmp: proc (
    a0: ptr igraphbitsett; a1: ptr igraphbitsett): cint {.cdecl.}): void {.
    cdecl, importc: "igraph_bitset_list_sort".}
proc igraphbitsetlistsortind*(v: ptr igraphbitsetlistt;
                              ind: ptr igraphvectorintt; cmp: proc (
    a0: ptr igraphbitsett; a1: ptr igraphbitsett): cint {.cdecl.}): igrapherrort {.
    cdecl, importc: "igraph_bitset_list_sort_ind".}
proc igraphreachability*(graph: ptr igrapht; membership: ptr igraphvectorintt;
                         csize: ptr igraphvectorintt;
                         noofcomponents: ptr igraphintegert;
                         reach: ptr igraphbitsetlistt; mode: igraphneimodet): igrapherrort {.
    cdecl, importc: "igraph_reachability".}
proc igraphcountreachable*(graph: ptr igrapht; counts: ptr igraphvectorintt;
                           mode: igraphneimodet): igrapherrort {.cdecl,
    importc: "igraph_count_reachable".}
proc igraphtransitiveclosure*(graph: ptr igrapht; closure: ptr igrapht): igrapherrort {.
    cdecl, importc: "igraph_transitive_closure".}