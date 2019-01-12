<#import "parts/common.ftl" as common>
<#assign links>
    <link rel="stylesheet" type="text/css" href="../css/films.css">
</#assign>

<#assign script>
    <script>
        function toggleSubCategories(_category, init) {
            if (!init) {
                document.querySelectorAll('.dropdown').forEach(function(category) {
                    if (category !== _category) {
                        category.classList.remove('show');
                    }
                });
                _category.classList.toggle('show');
            }
        }

        document.querySelectorAll('.dropdown_shedule').forEach(function(category) {
            toggleSubCategories(category.children[1], true);
            category.addEventListener('click', function(e) {
                toggleSubCategories(category.children[1], false);
                e.preventDefault();
            });
        });
        /*function DropDown(el) {
            this.dd = el;
            this.initEvents();
        }
        DropDown.prototype = {
            initEvents: function() {
                var obj = this;

                obj.dd.on("click", function(event) {
                    $(this).toggleClass("active");
                    event.stopPropagation();
                });
            }
        };

        $(function() {
            var dd = new DropDown($("#dd1"));
            $(document).click(function() {
                // all dropdowns
                $(".dropdown_shedule").removeClass("active");
            });
        });*/
    </script>
</#assign>

<@common.page links=links scripts=script>
    <div class="main">
        <div class="desktop_view">
            <div class="about">
                <div class="col-lg-12 col-md-12">
                    <div class="pic">
                        <img src="${film.image}">
                    </div>
                    <div class="large_rate">
                        <div class="rateIMDB">
                            <h4 class="textrate">${film.IMDBRate}/</h4>10
                            <div class="line">
                                <div class="rate" style="width: calc(${film.IMDBRate}px * 8)"></div>
                                <div class="rest" style="width: calc(80px - ${film.IMDBRate}px * 8)"></div>
                            </div>
                            <p class="textrate site">IMDB</p>
                        </div>
                        <div class="rateKINO">
                            <h4 class="textrate">${film.kinopoiskRate}/</h4>10
                            <div class="line">
                                <div class="rate" style="width: calc(${film.kinopoiskRate}px * 8)"></div>
                                <div class="rest" style="width: calc(80px - ${film.kinopoiskRate}px * 8)"></div>
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
                                    <div class="rate" style="width: calc(${film.IMDBRate}px * 8)"></div>
                                    <div class="rest" style="width: calc(80px - ${film.IMDBRate}px * 8)"></div>
                                </div>
                                <p class="textrate site">IMDB</p>
                            </div>
                            <div class="rateKINO">
                                <h4 class="textrate">${film.kinopoiskRate}/</h4>10
                                <div class="line">
                                    <div class="rate" style="calc(${film.kinopoiskRate}px * 8)"></div>
                                    <div class="rest" style="80px - calc(${film.kinopoiskRate}px * 8)"></div>
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
                                <div class="rate" style="width: calc(${film.IMDBRate}px * 8)"></div>
                                <div class="rest" style="width: calc(80px - ${film.IMDBRate}px * 8)"></div>
                            </div>
                            <p class="textrate site">IMDB</p>
                        </div>
                        <div class="rateKINO">
                            <h4 class="textrate">${film.kinopoiskRate}/</h4>10
                            <div class="line">
                                <div class="rate" style="width: calc(${film.kinopoiskRate}px * 8)"></div>
                                <div class="rest" style="width: calc(80px - ${film.kinopoiskRate}px * 8)"></div>
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
        <div class="shedule container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Расписание сеансов</h2>
                    <div class="list-structure">
                        <ul class="dropdown_main">
                            <li class="dropdown_shedule">
                                <p class="dropdown_title" href="#">Понедельник</p>
                                <ul class=" dropdown">
                                    <li>
                                        <a class="line_li_a" href="#">14:00</a>
                                        <a class="line_li_a" href="#">НашКинотетар</a>
                                        <a class="line_li_a" href="#">Самый большой зал</a>
                                        <button class="line_li_a">купить</button>
                                    </li>
                                    <li><a href="#">Подкатегория 1</a></li>
                                </ul>
                            </li>
                            <li class="test dropdown_shedule">
                                <p class="dropdown_title" href="#">Понедельник</p>
                                <ul class="dropdown">
                                    <li><a href="#">Подкатегория 1</a></li>
                                    <li><a href="#">Подкатегория 1</a></li>

                                </ul>
                            </li>
                            <li class="dropdown_shedule">
                                <p class="dropdown_title" href="#">Понедельник</p>
                                <ul class=" dropdown">
                                    <li><a href="#">Подкатегория 1</a></li>
                                    <li><a href="#">Подкатегория 1</a></li>
                                </ul>
                            </li>
                            <li class="dropdown_shedule">
                                <p class="dropdown_title" href="#">Понедельник</p>
                                <ul class=" dropdown">
                                    <li><a href="#">Подкатегория 1</a></li>
                                    <li><a href="#">Подкатегория 1</a></li>
                                </ul>
                            </li>
                            <li class="dropdown_shedule">
                                <p class="dropdown_title" href="#">Понедельник</p>
                                <ul class=" dropdown">
                                    <li><a href="#">Подкатегория 1</a></li>
                                    <li><a href="#">Подкатегория 1</a></li>
                                </ul>
                            </li>
                            <li class="dropdown_shedule">
                                <p class="dropdown_title" href="#">Понедельник</p>
                                <ul class=" dropdown">
                                    <li><a href="#">Подкатегория 1</a></li>
                                    <li><a href="#">Подкатегория 1</a></li>
                                </ul>
                            </li>

                            <li class="dropdown_shedule">
                                <p class="dropdown_title" href="#">Понедельник</p>
                                <ul class="dropdown">
                                    <li><a href="#">Подкатегория 1</a></li>
                                    <li><a href="#">Подкатегория 1</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    <!--<div class="shedule">
        <h2>Расписание сеансов</h2>
        <div id="dd1" class="dropdown_shedule">
            расписание
            <ul class="dropdown">
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
            </ul>
        </div>
        <div id="dd2" class="dropdown_shedule">
            расписание
            <ul class="dropdown">
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
            </ul>
        </div>
        <div id="dd3" class="dropdown_shedule">
            расписание
            <ul class="dropdown">
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
            </ul>
        </div>
        <div id="dd4" class="dropdown_shedule">
            расписание
            <ul class="dropdown">
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
            </ul>
        </div>
        <div id="dd5" class="dropdown_shedule">
            расписание
            <ul class="dropdown">
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
            </ul>
        </div>
        <div id="dd6" class="dropdown_shedule">
            расписание
            <ul class="dropdown">
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
                <li><a><i>ПН</i></a></li>
            </ul>
        </div>
    </div>-->
    </div>

</@common.page>