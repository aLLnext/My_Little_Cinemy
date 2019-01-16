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

        function starsReducer(state, action) {
            switch (action.type) {
                case 'HOVER_STAR': {
                    return {
                        starsHover: action.value,
                        starsSet: state.starsSet
                    }
                }
                case 'CLICK_STAR': {
                    return {
                        starsHover: state.starsHover,
                        starsSet: action.value
                    }
                }
                    break;
                default:
                    return state
            }
        }

        var StarContainer = document.getElementById('rating');
        var StarComponents = StarContainer.children;

        var state = {
            starsHover: 0,
            starsSet: 4
        }

        function render(value) {
            for(var i = 0; i < StarComponents.length; i++) {
                StarComponents[i].style.fill = i < value ? '#f39c12' : '#808080'
            }
        }

        for (var i=0; i < StarComponents.length; i++) {
            StarComponents[i].addEventListener('mouseenter', function() {
                state = starsReducer(state, {
                    type: 'HOVER_STAR',
                    value: this.id
                })
                render(state.starsHover);
            })

            StarComponents[i].addEventListener('click', function() {
                state = starsReducer(state, {
                    type: 'CLICK_STAR',
                    value: this.id
                })
                render(state.starsHover);
            })
        }

        StarContainer.addEventListener('mouseleave', function() {
            render(state.starsSet);
        })

        var review = document.getElementById('review');
        var remaining = document.getElementById('remaining');
        review.addEventListener('input', function(e) {
            review.value = (e.target.value.slice(0,999));
            remaining.innerHTML = (999-e.target.value.length);
        })

        function ReviewStarContainer(stars) {
            var div = document.createElement('div');
            div.className = "stars-container";
            for (var i = 0; i < 5; i++) {
                var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
                svg.setAttribute('viewBox',"0 12.705 512 486.59");
                svg.setAttribute('x',"0px");
                svg.setAttribute('y',"0px");
                svg.setAttribute('xml:space',"preserve");
                svg.setAttribute('class',"star");
                var svgNS = svg.namespaceURI;
                var star = document.createElementNS(svgNS,'polygon');
                star.setAttribute('points', '256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566');
                star.setAttribute('fill', i < stars ? '#f39c12' : '#808080');
                svg.appendChild(star);
                div.appendChild(svg);
            }
            return div;
        }
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
        <div class="shedule container-fluid">
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <h2>Расписание сеансов</h2>
                    <div class="list-structure">
                        <ul class="dropdown_main">
                            <#list sessions as session>
                            <li class="dropdown_shedule">
                                <p class="dropdown_title" href="#">${session[0].session_date}</p>
                                <ul class="dropdown">
                                    <#list session as ses>
                                    <li>
                                        <a class="line_li_a" href="#">${ses.session_time}</a>
                                        <a class="line_li_a" href="#">${ses.cinemaId}</a>
                                        <a class="line_li_a" href="#">${ses.hallId}</a>
                                        <button class="line_li_a">купить</button>
                                    </li>
                                    </#list>
                                </ul>
                            </li>
                            </#list>
                        </ul>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="Review container">
                <div class="Review-details">
                    <img src="https://randomuser.me/api/portraits/med/men/29.jpg">
                    <div class="Review-meta">
                        <p class="Review-author">Zachary Richardson</p>
                        <p class="Review-date">3 days ago</p>
                        <div class="Review-rating">
                            <span class="Review-star Review-star--active">&#9733;</span>
                            <span class="Review-star Review-star--active">&#9733;</span>
                            <span class="Review-star Review-star--active">&#9733;</span>
                            <span class="Review-star">&#9733;</span>
                            <span class="Review-star">&#9733;</span>
                        </div>
                    </div>
                </div>
                <div class="Review-body">
                    <h3 class="Review-title">The heat had forced its shells apart, and the meat, salmon-colored, was thoroughly cooked.</h3>
                    <p>That makes what I call one hundred. Remember that word—one hundred. Now I put this pebble in Hare-Lip's hand. It stands for ten grains of sand, or ten tens of fingers, or <strong>one hundred fingers</strong>. I put in ten pebbles. They stand for a <em>thousand</em> fingers. I take a mussel-shell, and it stands for ten pebbles, or one hundred grains of sand, or one thousand fingers&hellip;" And so on, laboriously, and with much reiteration, he strove to build up in their minds a crude conception of numbers.<br><br>
                        As the quantities increased, he had the boys holding different magnitudes in each of their hands. For still higher sums, he laid the symbols on the log of driftwood; and for symbols he was hard put, being compelled to use the teeth from the skulls for millions, and the crab-shells for billions.</p>
                </div>
            </div>
            <div class="container">
                <form id="review-form" action="index" method="post">
                    <h2>Write Your Review</h2>
                    <div id="rating">
                        <svg class="star" id="1" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve" style="fill: #f39c12;">
                      <polygon points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                    </svg>
                                <svg class="star" id="2" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve" style="fill: #f39c12;">
                      <polygon points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                    </svg>
                                <svg class="star" id="3" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve" style="fill: #f39c12;">
                      <polygon points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                    </svg>
                                <svg class="star" id="4" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve" style="fill: #f39c12;">
                      <polygon points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                    </svg>
                                <svg class="star" id="5" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve" style="fill: #808080;">
                      <polygon points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                    </svg>
                            </div>
                            <span id="starsInfo" class="help-block">
                    Click on a star to change your rating 1 - 5, where 5 = great! and 1 = really bad
                  </span>
                            <div class="form-group">
                                <label class="control-label" for="review">Your Review:</label>
                                <textarea class="form-control" rows="10" placeholder="Your Reivew" name="review" id="review"></textarea>
                                <span id="reviewInfo" class="help-block pull-right">
                      <span id="remaining">999</span> Characters remaining
                    </span>
                    </div>
                    <a href="#" id="submit" class="btn btn-primary">Submit</a>
                    <input id="submitForm" type="submit" style="display:none;">
                    <span id="submitInfo" class="help-block">
                    By clicking <strong>Submit</strong>, I authorize the sharing of my name and review on the web. (email will not be shared)
                  </span>
                </form>
            </div>
            <div class="container-fluid footer">
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
    </div>
</div>

</@common.page>