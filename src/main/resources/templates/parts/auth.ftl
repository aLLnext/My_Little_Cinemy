<#macro auth>
    <div class="cd-user-modal"> <!-- все формы на фоне затемнения-->
        <div class="cd-user-modal-container"> <!-- основной контейнер -->
            <ul class="cd-switcher">
                <li><a id = "registration" href="#0">Вход</a></li>
                <li><a href="#0">Регистрация</a></li>
            </ul>
            <div id="cd-login"> <!-- форма входа -->
                <form class="cd-form" action="/login" method="post">
                    <p class="fieldset">
                        <label class="image-replace cd-email" for="signin-email">E-mail</label>
                        <input class="full-width has-padding has-border" id="signin-email" type="text"
                               placeholder="E-mail" name="eMail">
                        <span class="cd-error-message">Здесь сообщение об ошибке!</span>
                    </p>
                    <p class="fieldset">
                        <label class="image-replace cd-password" for="signin-password">Пароль</label>
                        <input class="full-width has-padding has-border" id="signin-password" type="password"
                               placeholder="Пароль" name="password">
                        <a href="#0" class="hide-password">Показать</a>
                        <span class="cd-error-message">Здесь сообщение об ошибке!</span>
                    </p>
                    <p class="fieldset">
                        <input class="full-width" type="submit" value="Войти">
                    </p>
                </form>
                <p class="cd-form-bottom-message"><a href="#0">Забыли свой пароль?</a></p>
                <!-- <a href="#0" class="cd-close-form">Close</a> -->
            </div> <!-- конец блока с формой входа -->
            <div id="cd-signup"> <!-- блок с формой регистрации -->
                <form class="cd-form" action="/reg" method="post">
                    <p class="fieldset">
                        <label class="image-replace cd-username" for="signup-username">Имя пользователя</label>
                        <input class="full-width has-padding has-border" id="signup-username" type="text"
                               placeholder="Имя пользователя" name="name">
                        <#--<span class="cd-error-message">Здесь сообщение об ошибке!</span>-->
                    </p>
                    <p class="fieldset">
                        <label class="image-replace cd-email" for="signup-email">E-mail</label>
                        <input class="full-width has-padding has-border" id="signup-email" type="email"
                               placeholder="E-mail" name="eMail">
                        <#--<span class="cd-error-message">Здесь сообщение об ошибке!</span>-->
                    </p>
                    <p class="fieldset">
                        <label class="image-replace cd-password" for="signup-password">Пароль</label>
                        <input class="full-width has-padding has-border" id="signup-password" type="password"
                               placeholder="Пароль" name="password">
                        <a href="#0" class="hide-password">Показать</a>
                        <#--<span class="cd-error-message">Здесь сообщение об ошибке!</span>-->
                    </p>
                    <p class="fieldset">
                        <input type="checkbox" id="accept-terms">
                        <label for="accept-terms">Я согласен с <a href="#0">Условиями</a></label>
                    </p>
                    <p class="fieldset">
                        <input class="full-width has-padding" type="submit" value="Создать аккаунт">
                    </p>
                </form>
                <!-- <a href="#0" class="cd-close-form">Закрыть</a> -->
            </div> <!-- cd-signup -->
            <div id="cd-reset-password"> <!-- форма восстановления пароля -->
                <p class="cd-form-message">Забыли пароль? Пожалуйста, введите адрес своей электронной почты. Вы получите
                    ссылку, чтобы создать новый пароль.</p>
                <form class="cd-form">
                    <p class="fieldset">
                        <label class="image-replace cd-email" for="reset-email">E-mail</label>
                        <input class="full-width has-padding has-border" id="reset-email" type="email"
                               placeholder="E-mail">
                        <span class="cd-error-message">Здесь сообщение об ошибке!</span>
                    </p>
                    <p class="fieldset">
                        <input class="full-width has-padding" type="submit" value="Восстановить пароль">
                    </p>
                </form>
                <p class="cd-form-bottom-message"><a href="#0">Вернуться к входу</a></p>
            </div> <!-- cd-reset-password -->
            <a href="#0" class="cd-close-form">Закрыть</a>
        </div> <!-- cd-user-modal-container -->
    </div> <!-- cd-user-moda-->
</#macro>