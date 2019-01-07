<#import "parts/common.ftl" as common>
<#import "parts/auth.ftl" as auth>

<#assign indexScripts>
<script>
    var elems = [];
    <#list films_titles as film_title>
    var text = document.createElement('div');
    text.className = "text";
    text.innerHTML = "${film_title}";
    var obj = {};
    obj.text = text;
    elems.push(obj);
    <#else>
    alert("ПОРА ЗАНЯТЬСЯ ДЕЛОМ, А НЕ ФИЛЬМЫ СМОТРЕТЬ!");
    </#list>
    var index = 0;

    <#list films_pic as film_pic>
    var pic = document.createElement('img');
    pic.className = "pic";
    pic.src = "${film_pic}";
    elems[index].pic = pic;
    index = index + 1;
    </#list>

    for (let i = 0; i < elems.length; i++) {
        var elem = document.createElement('div');
        elem.className = "film_lg";
        elem.appendChild(elems[i].pic);
        elem.appendChild(elems[i].text);
        $(".all_films").append(elem)
    }

    function checkSize(current_size) {
        if (current_size.matches) {
            $(".main").css("height", (elems.length + 1) * 500 + 206)
        } else {
            $(".main").css("height", ((elems.length + 1) / 1.5) * 468 + 206)
        }
    }

    var size = window.matchMedia("(max-width: 855px)");
    checkSize(size);
    size.addListener(checkSize);
</script>
</#assign>

<@common.page scripts=indexScripts>
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
                <a href="#" class="buttonAFISHA">КИНОАФИША</a>
                <a href="#" class="buttonCINEMAS">КИНОТЕАТРЫ</a>
                <#if signedIn??>
                    <#if signedIn == true>
                        <a href="#0" id = "logout" class="auth_part login">ВЫЙТИ</a>
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
                <a href="#" class="buttonAFISHA">КИНОАФИША</a>
                <a href="#" class="buttonCINEMAS">КИНОТЕАТРЫ</a>
            </div>
            <div class="col-md-6 col-sm-4 btn_group_account">

                <#if signedIn??>
                    <#if signedIn == true>
                        <a href="#0" id = "registration" class="auth_part login">ВЫЙТИ</a>
                        <a href="account" class="profile">ПРОФИЛЬ</a>
                    <#else><a href="#0" id = "logout" class="auth_part login">ВОЙТИ</a>
                    </#if>
                </#if>
            </div>
        </div>
    </header>
    <div class="main">
        <div class="col-lg-3 col-md-3 col-sm-2"></div>
        <p class="main_text">АФИША ВО ВЛАДИВОСТОКЕ</p>
        <div class="all_films"></div>
    </div>
    <@auth.auth></@auth.auth>
</@common.page>
