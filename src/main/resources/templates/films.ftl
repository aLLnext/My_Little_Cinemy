<#import "parts/common.ftl" as common>
<#assign links>
    <link rel="stylesheet" type="text/css" href="../css/films.css">
</#assign>

<@common.page links=links>
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
                    <#if signedIn == true><a href="../account" class="profile">ПРОФИЛЬ</a>
                    <#else><a href="#0" id="registration" class="auth_part login">ВОЙТИ</a></#if>
                </#if>
            </div>
        </div>
        <ul>
            <div class="LOGO">НАШ КИНО ТЕАТР</div>
            <a href="../index" class="buttonAFISHA">КИНОАФИША</a>
            <a href="#" class="buttonCINEMAS">КИНОТЕАТРЫ</a>
                <#if signedIn??>
                    <#if signedIn == true>
                        <a href="#0" id="logout" class="auth_part login">ВЫЙТИ</a>
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
                        <a href="../logout" id="registration" class="login">ВЫЙТИ</a>
                        <a href="../account" class="profile">ПРОФИЛЬ</a>
                    <#else><a href="#0" id="logout" class="auth_part login">ВОЙТИ</a>
                    </#if>
            </#if>
        </div>
    </div>
</header>
    <div class="main">
        <div class="desktop_view">
            <div class="row about">
                <div class="col-lg-12 col-md-12">
                    <div class="pic">
                        <img src="${film.image}">
                    </div>
                    <div class="large_rate">
                        <div class="rateIMDB">
                            <h4 class="textrate">${film.IMDBRate}/</h4>10
                            <div class="line">
                                <div class="rate" style="width: calc(${film.IMDBRate} * 8)"></div>
                                <div class="rest" style="width: calc(80 - ${film.IMDBRate} * 8)"></div>
                            </div>
                            <p class="textrate site">IMDB</p>
                        </div>
                        <div class="rateKINO">
                            <h4 class="textrate">${film.kinopoiskRate}/</h4>10
                            <div class="line">
                                <div class="rate" style="width: calc(${film.kinopoiskRate} * 8)"></div>
                                <div class="rest" style="width: calc(80 - ${film.kinopoiskRate} * 8)"></div>
                            </div>
                            <p class="textrate site">КИНОПОИСК</p>
                        </div>
                    </div>

                    <div class="description">
                        <h5>${film.title}</h5>
                        <div>
                            <p><b>Жанр:</b></p>
                            <p>приключение, боевик</p>
                        </div>
                        <div>
                            <h5><b>В прокате с</b></h5>
                            <h5><b>${film.date_release}</b></h5>
                        </div>
                        <div>
                            <p><b>Ограничение по возрасту:</b></p>
                            <p><b>${film.rars}+</b></p>
                        </div>
                        <div>
                            <p><b>Производство: </b></p>
                            <p>Нероссия</p>
                        </div>
                        <div>
                            <p><b>Режиссер:</b></p>
                            <p>Хаяо Миядзаки</p>
                        </div>
                        <div>
                            <p><b>Продюссер:</b></p>
                            <p>Джордж Клуни</p>
                        </div>
                        <div>
                            <p><b>Сценарист:</b></p>
                            <p>Вильям Шекспир, Джоан Роулинг</p>
                        </div>
                        <div>
                            <p><b>Продолжительность:</b></p>
                            <p>${film.duration} мин</p>
                        </div>
                        <div class="roles">
                            <p><b>В ролях:</b></p>
                            <p>Какой-то Крутой Перец, Новая Классная Чувиха, Джекки Чан, Джордж Лукас, Кира Найтли</p>
                        </div>
                        <div class="text">
                            <p>${film.description}</p>
                        </div>
                        <div class="middle-rate">
                            <div class="rateIMDB">
                                <h4 class="textrate">${film.IMDBRate}/</h4>10
                                <div class="line">
                                    <div class="rate" style="width: calc(${film.IMDBRate} * 8)"></div>
                                    <div class="rest" style="width: calc(80 - ${film.IMDBRate} * 8)"></div>
                                </div>
                                <p class="textrate site">IMDB</p>
                            </div>
                            <div class="rateKINO">
                                <h4 class="textrate">${film.kinopoiskRate}/</h4>10
                                <div class="line">
                                    <div class="rate" style="calc(${film.kinopoiskRate} * 8)"></div>
                                    <div class="rest" style="80 - calc(${film.kinopoiskRate} * 8)"></div>
                                </div>
                                <p class="textrate site">КИНОПОИСК</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom_text">
                    <p>${film.description}</p>
                </div>
            </div>
        </div>

        <div class="mob_view">
            <div class="row about">
                <div class="col-sm-1"></div>
                <div class="col-sm-9">
                    <div class="pic">
                        <img src="${film.image}">
                        <div class="rateIMDB">
                            <h4 class="textrate">${film.IMDBRate}/</h4>10
                            <div class="line">
                                <div class="rate" style="width: calc(${film.IMDBRate} * 8)"></div>
                                <div class="rest" style="width: calc(80 - ${film.IMDBRate} * 8)"></div>
                            </div>
                            <p class="textrate site">IMDB</p>
                        </div>
                        <div class="rateKINO">
                            <h4 class="textrate">${film.kinopoiskRate}/</h4>10
                            <div class="line">
                                <div class="rate" style="width: calc(${film.kinopoiskRate} * 8)"></div>
                                <div class="rest" style="width: calc(80 - ${film.kinopoiskRate} * 8)"></div>
                            </div>
                            <p class="textrate site">КИНОПОИСК</p>
                        </div>
                    </div>
                </div>

                <div class="description">
                    <h5>${film.title}</h5>
                    <div>
                        <p><b>Жанр:</b></p>
                        <p>приключение, боевик</p>
                    </div>
                    <div>
                        <h5><b>В прокате с</b></h5>
                        <h5><b>${film.date_release}</b></h5>
                    </div>
                    <div>
                        <p><b>Ограничение по возрасту:</b></p>
                        <p><b>${film.rars}+</b></p>
                    </div>
                    <div>
                        <p><b>Производство: </b></p>
                        <p>Нероссия</p>
                    </div>
                    <div>
                        <p><b>Режиссер:</b></p>
                        <p>Хаяо Миядзаки</p>
                    </div>
                    <div>
                        <p><b>Продюссер:</b></p>
                        <p>Джордж Клуни</p>
                    </div>
                    <div>
                        <p><b>Сценарист:</b></p>
                        <p>Вильям Шекспир, Джоан Роулинг</p>
                    </div>
                    <div>
                        <p><b>Продолжительность:</b></p>
                        <p>${film.duration} мин</p>
                    </div>
                    <div class="roles">
                        <p><b>В ролях:</b></p>
                        <p>Какой-то Крутой Перец, Новая Классная Чувиха, Джекки Чан, Джордж Лукас, Кира Найтли</p>
                    </div>

                </div>
                <div class="bottom_text">
                    <p>${film.description}</p>
                </div>

                <div class="col-sm-2"></div>
            </div>
        </div>
    </div>
</@common.page>