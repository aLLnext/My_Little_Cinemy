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
                    <p class="desc">${film.description}</p>
                </div>
            </a>
        </#list>
        </div>
    </div>
    <@auth.auth></@auth.auth>
</@common.page>
