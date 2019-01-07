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

<@common.page scripts=accountScripts>
    <header>
        <nav>
            <div class="row">
                <div class="col-8">
                    <div class="navToggle">
                        <div class="icon-left"></div>
                        <div class="icon-right"></div>
                    </div>
                </div>
            </div>

            <ul>
                <div class="LOGO">НАШ КИНО ТЕАТР</div>
                <a href="index" class="buttonAFISHA">КИНОАФИША</a>
                <a href="#" class="buttonCINEMAS">КИНОТЕАТРЫ</a>
            </ul>
        </nav>

        <div class="LOGO">
            <p>НАШ КИНО ТЕАТР</p>
        </div>
        <a href="#" id="tab_name">ПРОФИЛЬ</a>
        <div class="row">
            <div class="col-6 btn_group_menu">
                <a href="index" class="buttonAFISHA">КИНОАФИША</a>
                <a href="#" class="buttonCINEMAS">КИНОТЕАТРЫ</a>
            </div>
        </div>
    </header>

    <div class="main">
        <div class="mob_info">
            <div class="row">
                <div class="col-md-6">
                    <p class="PersonalInfo">Персональная информация</p>
                    <form class="flex-column">
                        <div class="text-field-container">
                            <div class="text-field text-field--outlined <#if name??>has-value</#if>">
                                <input id="name_mob" type="text" value="${name}"/>
                                <label for="name_mob">имя</label>
                            </div>
                        </div>

                        <div class="text-field-container">
                            <div class="text-field text-field--outlined <#if email??>has-value</#if>">
                                <input id="email_mob" type="text" value="<#if email??>${email}<#else>No email</#if>"/>
                                <label for="email_mob">почта</label>
                            </div>
                        </div>

                        <div class="text-field-container">
                            <div class="text-field text-field--outlined has-value">
                                <input id="phone_mob" type="text" value="<#if phoneNumber??>${phoneNumber}<#else>No phone</#if>"/>
                                <label for="phone_mob">телефон</label>
                            </div>
                        </div>
                        <button type="submit" class="btn_save_account">
                            СОХРАНИТЬ
                        </button>
                    </form>

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
                    <p class="PersonalInfo">Персональная информация</p>
                    <form class="info">
                        <div class="text-field-container">
                            <div class="text-field text-field--outlined <#if name??>has-value</#if>">
                                <input id="name" type="text" value="${name}"/>
                                <label for="name">имя</label>
                            </div>
                        </div>

                        <div class="text-field-container">
                            <div class="text-field text-field--outlined <#if email??>has-value</#if>">
                                <input id="email" type="text" value="<#if email??>${email}<#else>No email</#if>"/>
                                <label for="email">почта</label>
                            </div>
                        </div>

                        <div class="text-field-container">
                            <div class="text-field text-field--outlined has-value">
                                <input id="phone" type="text" value="<#if phoneNumber??>${phoneNumber}<#else>No phone</#if>"/>
                                <label for="phone">телефон</label>
                            </div>
                        </div>
                        <button type="submit" class="btn_save_account">
                            СОХРАНИТЬ
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</@common.page>