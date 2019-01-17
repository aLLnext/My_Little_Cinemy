<#import "parts/common.ftl" as common>
<#assign accountScripts>
    <script>
        $('input').on('focus', function () {
            $(this).closest('.text-field').addClass('has-focus');
        });

        $('input').on('blur', function () {
            $(this).closest('.text-field').removeClass('has-focus');
        });

        $('input').on('change', function () {
            $wrapper = $(this).closest('.text-field');
            $value = $(this).val();
            console.log($value);
            if ($value) {
                $wrapper.addClass('has-value');
            } else {
                $wrapper.removeClass('has-value');
            }
        });
        /*TODO чекать размер на основе количества сеансов
        function checkSize(current_size) {
            if (current_size.matches) {
                $(".main").css("height", (elems.length + 1) * 500 + 206)
            } else {
                $(".main").css("height", ((elems.length + 1) / 1.5) * 468 + 206)
            }}

        var size = window.matchMedia("(max-width: 855px)");
        checkSize(size);
        size.addListener(checkSize);*/
    </script>
</#assign>

<#assign user_data>
<p class="PersonalInfo">Персональная информация</p>
<form class="flex-column" action="/updateuser" method="post">
    <div class="text-field-container">
        <div class="text-field text-field--outlined <#if name??>has-value</#if>">
            <input id="name_mob" type="text" value="${name}" name="name"/>
            <label for="name_mob">имя</label>
        </div>
    </div>

    <div class="text-field-container">
        <div class="text-field text-field--outlined <#if email??>has-value</#if>">
            <input id="email_mob" type="text" value="<#if email??>${email}<#else>No email</#if>" name="eMail"/>
            <label for="email_mob">почта</label>
        </div>
    </div>

    <div class="text-field-container">
        <div class="text-field text-field--outlined has-value">
            <input id="phone_mob" type="text" value="<#if phoneNumber??>${phoneNumber}<#else>No phone</#if>" name="phoneNumber"/>
            <label for="phone_mob">телефон</label>
        </div>
    </div>
    <button type="submit" class="btn_save_account">
        СОХРАНИТЬ
    </button>
</form>
</#assign>
<@common.page scripts=accountScripts>
    <div class="main">
        <div class="mob_info">
            <div class="row">
                <div class="col-md-6">
                    ${user_data}
                </div>
                <div class="col-md-6">
                    <p class="MyHistory">Мои сеансы</p>
                </div>
            </div>
        </div>

        <div class="desktop_info">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <p class="MyHistory">Мои сеансы</p>
                </div>
                <div class="col-lg-2 col-md-1">
                    <hr id="vertical_line">
                </div>
                <div class="col-lg-6 col-md-6">
                    ${user_data}
                </div>
            </div>
        </div>
    </div>
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