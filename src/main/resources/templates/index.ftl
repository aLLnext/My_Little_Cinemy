<#import "parts/common.ftl" as common>
<#import "parts/auth.ftl" as auth>

<#assign indexScripts>
<script>
    //это костыль для работы футера
    function checkSize(current_size) {
        size = ${films?size}
        if (current_size.matches) {
            $(".main").css("height", (size + 1) * 500 + 206)
        } else {
            $(".main").css("height", ((size + 1) / 1.5) * 468 + 206)
        }
    }

    var size = window.matchMedia("(max-width: 855px)");
    checkSize(size);
    size.addListener(checkSize);
</script>
</#assign>

<@common.page scripts=indexScripts>
    <div class="main">
        <div class="col-lg-3 col-md-3 col-sm-2"></div>
        <p class="main_text">АФИША ВО ВЛАДИВОСТОКЕ</p>
        <div class="all_films">
        <#list films as film>
            <a class="film_lg" href="/films/${film.id}">
                <img class="pic" src="${film.image}">
                <div class="text">
                    <h6 class="title"><b>${film.title}</b></h6>
                    <blockquote class="desc">${film.description}</blockquote>
                </div>
            </a>
        </#list>
        </div>
    </div>
    <@auth.auth></@auth.auth>
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
    <#if signedIn??>
        <#if signedIn == true>
            <a href="../account">Профиль</a>
        </#if>
    </#if>
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
</@common.page>
