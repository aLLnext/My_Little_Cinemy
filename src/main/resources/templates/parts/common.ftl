<#macro page scripts="" links="">
<!DOCTYPE HTML>
<!-- TODO: Change shortcut icon, title!!!-->
<html>
<head>
    <title>OurCinema</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <link rel="stylesheet" type="text/css" href="../css/media.css">
    <link rel="stylesheet" type="text/css" href="../css/reg.css">
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    ${links}
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700&amp;subset=cyrillic,cyrillic-ext"
          rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<header>
    <nav>
        <div class="row">
            <div class="col-7">
                <div class="navToggle">
                    <div class="icon-left"></div>
                    <div class="icon-right"></div>
                </div>
            </div>
            <div class="col-5 btn_group_account">
            <#if signedIn??>
                <#if signedIn == true><a href="account" class="profile">ПРОФИЛЬ</a>
                <#else><a href="#0" id = "registration" class="auth_part login">ВОЙТИ</a></#if>
            </#if>
            </div>
        </div>
        <ul>
            <div class="LOGO">НАШ КИНО ТЕАТР</div>
            <a href="../index" class="buttonAFISHA">КИНОАФИША</a>
            <a href="#" class="buttonCINEMAS">КИНОТЕАТРЫ</a>
            <#if signedIn??>
                <#if signedIn == true>
                    <a href="../logout" id = "logout" class="auth_part login">ВЫЙТИ</a>
                </#if>
            </#if>
        </ul>
    </nav>
    <div class="LOGO">
        <p>НАШ КИНО ТЕАТР</p>
    </div>
    <a href="#" id="city">ВЛАДИВОСТОК</a>
        <div class="row">
    <div class="col-md-6 col-sm-4 btn_group_menu">
        <a href="../index" class="buttonAFISHA">КИНОАФИША</a>
        <a href="#" class="buttonCINEMAS">КИНОТЕАТРЫ</a>
    </div>
        <div class="col-md-6 col-sm-4 btn_group_account">
        <#if signedIn??>
            <#if signedIn == true>
                <a href="../logout" id = "registration" class="login">ВЫЙТИ</a>
                <a href="../account" class="profile">ПРОФИЛЬ</a>
            <#else><a href="#0" id = "logout" class="auth_part login">ВОЙТИ</a>
            </#if>
        </#if>
        </div>
    </div>
</header>
<#nested>
<div class="footer">
    <div class="row">
        <div class="first_column col-lg-3 col-md-4 col-sm-6">
            <div class="LOGO">НАШ КИНО ТЕАТР</div>
            <p>@2018 ourcinema.ru</p>
        </div>
        <div class="second_column col-lg-2 col-md-2 col-sm-6">
            <div class="sections">
                <h6>Разделы</h6>
                <a href="#">Кинотеатры</a>
                <a href="../index">Киноафиша</a>
                <#if signedIn == true><a href="../account">Профиль</a></#if>
            </div>
            <p>+79990009900</p>
        </div>
        <div class="third_column col-lg-3 col-md-3 col-sm-6">
            <div class="sections">
                <h6>Информация</h6>
                <a href="#">Пользовательское соглашение</a>
                <a href="#">Вернуть билет</a>
            </div>
            <a href="#">bilet@ourcinema.ru</a>
        </div>
        <div class="fourth_column col-lg-4 col-md-2 col-sm-6">
            <a href="#">Правила и условия</a>
            <a href="#">Реклама</a>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/reg.js"></script>
<script>
    $(".navToggle").click(function () {
        $("nav").toggleClass("open");
        $(this).toggleClass("open");
        $(".main").toggleClass("open");
    });
</script>
${scripts}
</body>
</html>
</#macro>