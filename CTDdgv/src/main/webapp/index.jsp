<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="language" content="en" />
    <meta name="author" content="CTDdgv" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>CTDdgv</title>

    <link rel="shortcut icon" href="IMAGE/c.png" type="image/x-icon">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js">
        <link href="css/sweetalert.css" rel="stylesheet">
            <script src="js/index.js"></script>
    <link href="css/aos.css" rel="stylesheet">
    <link href="css/pattern.css" rel="stylesheet">
    <script src="js/aos.js"></script>
    <link href="css/swiper-bundle.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <script src="js/swiper-bundle.js"></script>
    <script src="js/type.js"></script>
    <!--    autocomplete    -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/jquery-autocomplete.js"></script>
    <script src="js/costom-autocomplete.js"></script>
    <!--    stactic     -->
    <script src="js/echarts.js"></script>
    <script src="js/chart.js"></script>
    <script src="js/roma.js"></script>
    <script src="js/roma2.js"></script>
    <!--    custom  -->
    <link href="css/index.css" rel="stylesheet">
    <style>
        .navbar *{
            background-color: transparent;
        }
        .dropdown-menu, .dropdown-menu li a{
            font-family: "Gill Sans", sans-serif;
            background-color: #599a94;
            font-size: 1.3rem;
            color: #e8e8e8 ;
            font-weight: 600;
        }
        .dropdown-menu{
            border-color: #3E6C6F;
            border-width: 1px;
            -webkit-transition: all 0.5s ease-in;
            -moz-transition: all 0.5s ease-in;
            -ms-transition: all 0.5s ease-in;
            -o-transition: all 0.5s ease-in;
            transition: all 0.5s ease-in;
        }
        .dropdown-menu a:hover{
            color: #3E6C6F !important;
            background-color: aliceblue !important;
        }
        .transp {
            background-color:transparent;
            transition: background-color 1.5s;
        }
        .notransp{
            background-image: url(IMAGE/non_index.svg);
            background-repeat: no-repeat;
            background-size: cover;
            transition: background-color 1.5s;
        }
        .thumbnail h3{
            font-size: 2rem;
        }
        .swal2-popup {
            width: 400px; /* 设置宽度 */
            height: auto; /* 设置高度为自动 */
            font-size: 3rem; /* 设置字体大小 */
            font-weight: bold; /* 设置字体粗细 */
        }
    </style>
</head>

<body style="margin: 0; overflow-x: hidden;">
<div class="container-fluid">  <!--   body内所有内容都要包裹，作用是根据内容多少动态收缩  -->
    <div class="row clearfix ">   <!--    每一个大块用一个   -->
        <div class="col-md-12" style="position: relative; background-image:url(IMAGE/bg.svg);  background-repeat: no-repeat;  background-size: cover !important; width: 100%;height: 520px;">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <nav class="navbar navbar-default navbar-fixed-top transp" style="border-color:transparent;" id="navigation" role="navigation">
                        <div style="width: 50%; height: 100px; position: absolute;"><a href="index.html"><img src="IMAGE/logo.svg" style="position:relative;width:50%;height:90%; display: inline-block;"></a></div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li>
                                    <a href="index.html" class="active">Home</a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: transparent !important;">Curation<strong class="caret"></strong></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="search_mo.html">Variant-orient(VL)</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="search_fo_ml.html">Function-orient(VL)</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="search_go.html">Gene-orient(GL)</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="search_fo_gl.html">Function-orient(GL)</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="curation.html">Search</a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: transparent !important;">Tools<strong class="caret"></strong></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="tool1.html">geMERlb</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="tool2.html">CTDdgv-overlap</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="tool3.html">CTDdgv-function</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="tool4.html">CTDdgv-survival</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="tool5.html">CTDdgv-expression</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="jbrowse.html">Genome Browser</a>
                                </li>
                                <li>
                                    <a href="download.html">Download</a>
                                </li>
                                <li>
                                    <a href="submitdata.html">Submit data</a>
                                </li>
                                <li>
                                    <a href="helps.html">Help</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

            <div id="index_re" name="index_re" class="row clearfix" style="margin: 0%; padding: 0%;">
                <div class="col-md-7 column ne">
                    <div id="typeh"><span id="typedh" style="font-size: 6rem;font-weight: 500;"></span></div>
                    <br>
                    <div id="typee"><span id="typede" style="font-size: 2rem"></span></div>
                </div>
                <div class="col-md-5 column" style="height: 100%;">
                    <div  class="qsearch_font" style="position: relative; top: 30%; left: -10%; height: 100%; width: 100%;">
                        <h1>
                            QUICK SEARCH
                        </h1>
                        <form id="quick-search-form" method="get" action="quicksearch.jsp" onsubmit="return checkip()">
                            <div class="searchBox">
                                <input class="searchInput" id="quickinput" type="text" name="quicksearch" placeholder="Input keywords..." autofocus>
                                <button type="submit" class="searchButton" href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="29" height="29" viewBox="0 0 29 29" fill="none">
                                        <g clip-path="url(#clip0_2_17)">
                                            <g filter="url(#filter0_d_2_17)">
                                                <path d="M23.7953 23.9182L19.0585 19.1814M19.0585 19.1814C19.8188 18.4211 20.4219 17.5185 20.8333 16.5251C21.2448 15.5318 21.4566 14.4671 21.4566 13.3919C21.4566 12.3167 21.2448 11.252 20.8333 10.2587C20.4219 9.2653 19.8188 8.36271 19.0585 7.60242C18.2982 6.84214 17.3956 6.23905 16.4022 5.82759C15.4089 5.41612 14.3442 5.20435 13.269 5.20435C12.1938 5.20435 11.1291 5.41612 10.1358 5.82759C9.1424 6.23905 8.23981 6.84214 7.47953 7.60242C5.94407 9.13789 5.08145 11.2204 5.08145 13.3919C5.08145 15.5634 5.94407 17.6459 7.47953 19.1814C9.01499 20.7168 11.0975 21.5794 13.269 21.5794C15.4405 21.5794 17.523 20.7168 19.0585 19.1814Z" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" shape-rendering="crispEdges"></path>
                                            </g>
                                        </g>
                                        <defs>
                                            <filter id="filter0_d_2_17" x="-0.418549" y="3.70435" width="29.7139" height="29.7139" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                                <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
                                                <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"></feColorMatrix>
                                                <feOffset dy="4"></feOffset>
                                                <feGaussianBlur stdDeviation="2"></feGaussianBlur>
                                                <feComposite in2="hardAlpha" operator="out"></feComposite>
                                                <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"></feColorMatrix>
                                                <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_2_17"></feBlend>
                                                <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_2_17" result="shape"></feBlend>
                                            </filter>
                                            <clipPath id="clip0_2_17">
                                                <rect width="28.0702" height="28.0702" fill="white" transform="translate(0.403503 0.526367)"></rect>
                                            </clipPath>
                                        </defs>
                                    </svg>


                                </button>
                            </div>
                        </form>



                        <!--
                        <form class="form-inline" role="form">
                            <div class="form-group" style="height: 100%; width: 100%;">
                                <input type="text" class="form-control" id="name" style="width: 60%; height: 10%;"
                                        autofocus="autofocus" placeholder="EGFR">
                                       <label for="sb"><img src="IMAGE/搜索.png" style="width: 50px; height: 50px; margin-left: 10px; cursor: pointer;"></label><button id ="sb" type="submit" class="btn btn-default" style="visibility: hidden;">提交</button>
                            </div>
                        </form>
                        -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 滑块  -->
    <div class="row clearfix">
        <div class="col-md-12 " style="position: relative; overflow: hidden; width: ;idth: 100%; height:375px;float:right; background: url(IMAGE/slide_bg.svg) no-repeat;background-size: cover !important; padding-top: 10px;">
            <div class="row clearfix">
                <div class="col-md-2">
                    <div style="background-image: url(IMAGE/controller_light.svg); background-repeat: no-repeat; background-size: 100% 100%; width: 100%; height: 95%; z-index: 10 !important;">
                        <div id="gear"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <div class="col-md-10 animate__animated animate__bounceInRight animate__slow" style="padding: 0px 45px 0 45px;">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img src="IMAGE/database.png" style="width: 80%; height: 40%; position: relative; left: 10%;" /></div>
                                        <div class="caption">
                                            <h3>
                                                Curation
                                            </h3>
                                            <p>
                                                The curation interface provides precise query functions for Gene-Level (GL) and Variant-Level (VL), using a combination of keywords like disease, gene, variants type, et al.
                                            </p>
                                            <div style="position: absolute;bottom: 5px; left: 25px">
                                                <div class="row clearfix ">
                                                    <div class="col-md-12">
                                                        <div class="col-md-6" style="padding: 3px 2px 3px 2px;">
                                                            <a href="search_mo.html"><button style="width: 95px;font-size: 0.8rem;">Variant-orient(VL)</button></a>
                                                        </div>
                                                        <div class="col-md-6" style="padding: 3px 2px 3px 2px;">
                                                            <a href="search_fo_ml.html"><button style="width: 95px; font-size: 0.8rem;">Function-orient(VL)</button></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row clearfix ">
                                                    <div class="col-md-12">
                                                        <div class="col-md-6" style="padding: 3px 2px 3px 2px;">
                                                            <a href="search_go.html"><button style="width: 95px;font-size: 0.8rem;">Gene-orient(GL)</button></a>
                                                        </div>
                                                        <div class="col-md-6" style="padding: 3px 2px 3px 2px;">
                                                            <a href="search_fo_gl.html"><button style="width: 95px; font-size: 0.8rem;">Function-orient(GL)</button></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img src="IMAGE/CUR.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                Search
                                            </h3>
                                            <p>
                                                The Search interface provides a query for tumor driver genes and tumor driver variants predicted by the geMERlb pipeline.
                                            </p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="curation.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img alt="300x200" src="IMAGE/tools_icon.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                geMERlb
                                            </h3>
                                            <p>
                                                A tool that utilizes mutation profiles and patient survival information to predict tumor driver genes and variants, as well as to perform survival analysis.
                                            <p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="tool1.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img src="IMAGE/CTDdgv-overlap.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                CTDdgv-overlap
                                            </h3>
                                            <p>
                                                A tool to explore the intersection of novel identified driver genes, known driver genes, and cancer hallmarks.
                                            </p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="tool2.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img alt="300x200" src="IMAGE/CTDdgv-function.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                CTDdgv-function
                                            </h3>
                                            <p>
                                                A tool to explore the function of identified driver gene sets based on Gene Ontology (GO) terms and KEGG pathways .
                                            <p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="tool3.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img alt="300x200" src="IMAGE/CTDdgv-survival.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                CTDdgv--survival
                                            </h3>
                                            <p>
                                                A tool to assess the prognostic significance of mutations in ctDNA and tissue samples across the selected cancer type and gene.
                                            <p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="tool4.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img alt="300x200" src="IMAGE/CTDdgv-expression.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                CTDdgv--expression
                                            </h3>
                                            <p>
                                                A tool to explore the oncogenic expression patterns of driver genes pre-identified in ctDNA and TCGA mutation profiles
                                            <p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="tool5.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img alt="200x200" src="IMAGE/downl.png" style="width: 60%; height: 40%; position: relative; left: 20%;" /></div>
                                        <div class="caption">
                                            <h3>
                                                Download
                                            </h3>
                                            <p>
                                                Providing bulk downloads of ctDNA mutation spectra and curated data at the Variant Level, Gene Level, and Prediction Level.
                                            </p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="download.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img alt="300x200" src="IMAGE/jb.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                Genome browser
                                            </h3>
                                            <p>
                                                Experimentally validated missense mutations and tumor driver variants predicted are visualized on the Genome Browser.
                                            </p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="jbrowse.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="col-md-12">
                                    <div class="thumbnail" style="height: 100%;">
                                        <div class="slide_s"><img src="IMAGE/SUB.svg" style="width: 80%; height: 40%; position: relative; left: 10%;"/></div>
                                        <div class="caption">
                                            <h3>
                                                Submit
                                            </h3>
                                            <p>
                                                Upload experimentally supported variants data to expand our database.
                                            </p>
                                            <div style="position: absolute;bottom: 20px;left: 50%;transform: translateX(-50%)">
                                                <a href="submitdata.html"><button>detail</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Initialize Swiper -->
                        <script>
                            /*
                            function get_cookie(Name) {
                                var search = Name + "=";
                                var returnvalue = "";
                                if (document.cookie.length > 0) {
                                    offset = document.cookie.indexOf(search);
                                    if (offset != -1) {
                                        // if cookie exists
                                        offset += search.length;
                                        // set index of beginning of value
                                        end = document.cookie.indexOf(";", offset);
                                        // set index of end of cookie value
                                        if (end == -1)
                                            end = document.cookie.length;
                                        returnvalue=decodeURI(document.cookie.substring(offset, end))
                                    }
                                }
                                return returnvalue;
                            }

                            setTimeout(function(){
                                if (get_cookie("popped")==""){
                                    document.cookie="popped=yes";
                                    Swal.fire({
                                        text: "\"This website is free and open to all users and there is no login requirement.\"",
                                        customClass: "swal2-popup"
                                    });
                                }
                            },2000);
                            */
                            setTimeout(function(){
                                Swal.fire({
                                    text: "\"This website is free and open to all users and there is no login requirement.\"",
                                    customClass: "swal2-popup"
                                });
                            },2000);
                            var swiper = new Swiper(".mySwiper", {
                                effect: "coverflow",
                                grabCursor: true,
                                loop: true,
                                centeredSlides: true,
                                slidesPerView: "auto",
                                autoplay: {
                                    disableOnInteraction: false,
                                    delay: 3000,
                                },
                                coverflowEffect: {
                                    rotate: 10,
                                    stretch: 2,
                                    depth: 20,
                                    modifier: 3,
                                    slideShadows: false,
                                },
                                pagination: {
                                    el: ".swiper-pagination",
                                },
                                navigation: {
                                    nextEl: ".swiper-button-next",
                                    prevEl: ".swiper-button-prev",
                                },
                            });
                            swiper.el.onmouseover = function(){ //鼠标放上暂停轮播
                                swiper.autoplay.stop();}
                            swiper.el.onmouseleave = function(){
                                swiper.autoplay.start();}
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row clearfix" style="width: 90%; margin-left: 10%;">
        <div class="col-md-12 column statistics">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <h2>statistics</h2>
                    <ul class="nav nav-pills">
                        <li>
                            <a><img src="IMAGE/icon_al.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px"> <span class="badge pull-right">24686</span>Total records</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_ds.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "> <span class="badge pull-right">115</span>Total Disease</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_gene.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">2416</span>Toal Gene</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_var.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">12</span>variants type</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_var_num.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">487</span>variants counts</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_therapy.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">321</span>Therapy</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_res.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">494</span>Drug resistance</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_pro.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">770</span>Prognosis</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_characters.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">95</span>Tumor characters</a>
                        </li>
                        <li>
                            <a><img src="IMAGE/icon_mata.png" style="width: 20px; height: 20px; position: relative; margin-right: 10px "><span class="badge pull-right">91</span>Metastasis biomarker</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-6 col-sm-6 column" data-aos="zoom-in"  data-aos-duration="1000"  data-aos-delay="500">
                    <div id="disease" class="bar"></div>
                </div>
                <div class="col-md-6 col-sm-6 column" data-aos="zoom-in"  data-aos-duration="1000"  data-aos-delay="500">
                    <div id="gene" class="bar"></div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-6 col-sm-6 column" data-aos="zoom-in"  data-aos-duration="1000"  data-aos-delay="1000">
                    <div id="variants" class="pie"></div>
                </div>
                <div class="col-md-6 col-sm-6 column" data-aos="zoom-in"  data-aos-duration="1000"  data-aos-delay="1000">
                    <div id="missense" class="pie"></div>
                </div>
            </div>
            <!--      prediction statistics     -->
            <div class="row clearfix">
                <div class="col-md-6 col-sm-6 column" data-aos="zoom-in"  data-aos-duration="1000"  data-aos-delay="1000">
                    <div id="pre_disease" class="bar"></div>
                </div>
                <div class="col-md-6 col-sm-6 column" data-aos="zoom-in"  data-aos-duration="1000"  data-aos-delay="1000">
                    <div id="pre_gene" class="bar"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 col-sm-12 column" id="index_foot_top" >
            <div class="col-md-4 col-sm-4 column">
                <div style="width: 60%; margin-left: 20%; margin-top: 20px; height: 200px">
                    <script type="text/javascript" src="//rf.revolvermaps.com/0/0/7.js?i=5afrd2v5929&amp;m=0&amp;c=ff0000&amp;cr1=ffffff&amp;br=7&amp;sx=0" async="async"></script>
                </div>
                <div style="margin-left: 20%; margin-top: 10px; height: 40px">
                    <script type="text/javascript" src="//rf.revolvermaps.com/0/0/0.js?i=5k5bcs6da8y&amp;d=3&amp;p=0&amp;b=0&amp;w=293&amp;g=2&amp;f=arial&amp;fs=12&amp;r=0&amp;c0=362b05&amp;c1=375363&amp;c2=000000&amp;ic0=0&amp;ic1=0" async="async"></script>
                </div>
            </div>
            <div class="col-md-5 col-sm-5 column">
                <div class="foot_message" data-aos="fade-up" data-aos-duration="1000"  data-aos-delay="1000">
                    <h4>Please cite:</h4>
                    <p>CTDdgv: a web server for the identification and clinical interpretation of ctDNA driver genes and variants in cancer</p>
                    <h4 style="margin-top: 25px">Please email:</h4>
                    <p>zhihui@ems.hrbmu.edu.cn</p>
                    <p>yuncong_Wang@outlook.com</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-3 column">
                <div class="foot_message" data-aos="fade-up" data-aos-duration="1000"  data-aos-delay="1500">
                    <h4>Relative Links:</h4>
                    <ul style="padding-left: 0;">
                        <li><a target="_blank" href="http://www.bio-bigdata.net/lnc2cancer/"><i class="fa fa-angle-double-right"></i>Lnc2Cancer 3.0: <span style="font-size: 1.2rem;"> &nbsp;Experimentally supported LncRna and Cancer Associations Database.</span></a></li>
                        <li><a target="_blank" href="http://bio-bigdata.hrbmu.edu.cn/lincsnp/"><i class="fa fa-angle-double-right"></i>LincSNP 3.0: <span style="font-size: 1.2rem;"> &nbsp;Disease-associated SNPs in Human lncRNAs and their TFBSs.</span></a></li>
                        <li><a target="_blank" href="http://bio-bigdata.hrbmu.edu.cn/Lnc2Meth"><i class="fa fa-angle-double-right"></i>Lnc2Meth: <span style="font-size: 1.2rem;"> &nbsp;Regulatory relationships between Human LncRNAs and DNA Methylation.</span></a></li>
                        <li><a target="_blank" href="https://civicdb.org/"><i class="fa fa-angle-double-right"></i>CIVIC: <span style="font-size: 1.2rem;"> &nbsp;Clinical interpretations of Variants in Cancer. </span></a></li>
                        <li><a target="_blank" href="https://ckb.jax.org/"><i class="fa fa-angle-double-right"></i>CKB: <span style="font-size: 1.2rem;"> &nbsp;Database of Gene/Variant Annotations and Therapy knowledge to Oncology. </span></a></li>
                    </ul>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="index_foot">© College of Bioinformatics Science and Technology, Harbin Medical University, Harbin, China. </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--       头部引入报错       -->

<script>
    function checkip(){
        debugger
        var qs = $("#quickinput").val();
        if (qs==''){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'input disease or gene query!',
            })
            return false;
        }else {
            return true;
        }
    }
    AOS.init({

    });
    // typewriterAn open variants annotation database in clinical
    var typedh = new Typed('#typedh', {
        strings: ['Welcome to CTDdgv'],
        typeSpeed: 30,
        showCursor: true,
        cursorChar: '|',
        autoInsertCss: true,

    });
    var typede = new Typed('#typede', {
        strings: ['A web server for identifying and interpreting driver genes and variants in circulating tumor DNA'],
        typeSpeed: 10,
        startDelay: 1500
    });
</script>

<script>
    var parent = document.getElementById("navigation");
    function scroll_t(){
        if (window.pageYOffset === 0) {
            parent.classList.replace('notransp','transp');
            window.removeEventListener('scroll', scroll_t);
            window.addEventListener('scroll', scroll_h);
        }
    }
    function scroll_h(){
        var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
        if (scrollPosition > 0) {
            parent.classList.replace('transp','notransp');
            window.removeEventListener('scroll', scroll_h);
            window.addEventListener('scroll', scroll_t);
        }
    }
    window.addEventListener('scroll', scroll_h);

</script>
<script src="js/sweetalert.js"></script>
</body>
</html>