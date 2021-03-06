<#import "parts/common.ftl" as common>
<#import "parts/auth.ftl" as auth>

<#assign links>
    <link rel="stylesheet" type="text/css" href="../css/films.css">
</#assign>

<#assign script>
    <script>



        function toggleSubCategories(_category, init) {
            if (!init) {
                document.querySelectorAll('.dropdown').forEach(function (category) {
                    if (category !== _category) {
                        category.classList.remove('show');
                    }
                });
                _category.classList.toggle('show');
            }
        }

        document.querySelectorAll('.dropdown_shedule').forEach(function (category) {
            toggleSubCategories(category.children[1], true);
            category.addEventListener('click', function (e) {
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
            for (var i = 0; i < StarComponents.length; i++) {
                StarComponents[i].style.fill = i < value ? '#f39c12' : '#808080'
            }
        }

        for (var i = 0; i < StarComponents.length; i++) {
            StarComponents[i].addEventListener('mouseenter', function () {
                state = starsReducer(state, {
                    type: 'HOVER_STAR',
                    value: this.id
                });
                render(state.starsHover);
            });

            StarComponents[i].addEventListener('click', function () {
                state = starsReducer(state, {
                    type: 'CLICK_STAR',
                    value: this.id
                });
                render(state.starsHover);
            })
        }

        StarContainer.addEventListener('mouseleave', function () {
            render(state.starsSet);
        });

        var review = document.getElementById('review');
        var remaining = document.getElementById('remaining');
        review.addEventListener('input', function (e) {
            review.value = (e.target.value.slice(0, 999));
            remaining.innerHTML = (999 - e.target.value.length);
        });
        
        function order() {
            var selected = document.getElementsByClassName("selected");
            if (selected.length > 0) {
                let ses_id = (selected.item(0).parentNode).id;
                let places = [];
                for (let i = 0; i < selected.length; i++) {
                    places.push({posX: selected.item(i).id[0], posY: selected.item(i).id[2]});
                    selected[i].classList.add('booked');
                    selected[i].classList.remove('selected');
                }
                var counter = document.getElementsByClassName('count_b');
                var cost = document.getElementsByClassName('cost');
                for (var i = 0; i < counter.length; i++)
                {
                    counter[i].innerText = '0';
                    cost[i].innerText = '0';
                }
                // alert(places);
                // alert(JSON.stringify({p: places}));
                var xhttp = new XMLHttpRequest();
                var body = "places=" + encodeURIComponent(JSON.stringify(places)) + "&session_id=" + encodeURIComponent(ses_id);
                xhttp.open("POST", "/test", true);
                xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhttp.send(body);
                xhttp.onreadystatechange = function () {
                    console.log(xhttp.responseText);
                }
            }


        }
        function ReviewStarContainer(stars) {
            var div = document.createElement('div');
            div.className = "stars-container";
            for (var i = 0; i < 5; i++) {
                var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
                svg.setAttribute('viewBox', "0 12.705 512 486.59");
                svg.setAttribute('x', "0px");
                svg.setAttribute('y', "0px");
                svg.setAttribute('xml:space', "preserve");
                svg.setAttribute('class', "star");
                var svgNS = svg.namespaceURI;
                var star = document.createElementNS(svgNS, 'polygon');
                star.setAttribute('points', '256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566');
                star.setAttribute('fill', i < stars ? '#f39c12' : '#808080');
                svg.appendChild(star);
                div.appendChild(svg);
            }
            return div;
        }
        <#list sessions as session>
            <#if session[0]??>
                <#list session as ses>
                    var modalb = document.getElementById('modalbody${ses[0].id}');
                    var hall = document.createElement('div');
                    hall.classList.add('hall');

                    var row = document.createElement('div');
                    row.id = ${ses[0].id}
                    row.classList.add('hall_row');
                    var div_row_n = document.createElement('div');
                    var row_n = document.createElement('h6');
                    row_n.innerText = ${ses[3][0].line};
                    div_row_n.appendChild(row_n);
                    row.appendChild(div_row_n);
                    <#list ses[3] as ticket>
                        if(row.childNodes.length <= ${ses[2].place}){
                            var place = document.createElement('div');
                            place.classList.add('place');
                            place.id = ${ticket.line} +"."+ ${ticket.place};
                            place.addEventListener("click", showrow);
                            <#if ticket.bookId?has_content>
                            place.classList.add('booked');
                            </#if>
                            var num = document.createElement('p');
                            num.innerText = ${ticket.place};
                            place.appendChild(num);
                            row.appendChild(place);row.id = ${ses[0].id}
                        }else{
                            hall.appendChild(row);
                            var row = document.createElement('div');
                            row.id = ${ses[0].id}
                            row.classList.add('hall_row');
                            var div_row_n = document.createElement('div');
                            var row_n = document.createElement('h6');
                            row_n.innerText = ${ticket.line};
                            div_row_n.appendChild(row_n);
                            row.appendChild(div_row_n);

                            var place = document.createElement('div');
                            place.classList.add('place');
                            place.id = ${ticket.line} +"."+ ${ticket.place};
                            place.addEventListener("click", showrow);
                            <#if ticket.bookId?has_content>
                                place.classList.add('booked');
                            </#if>
                            var num = document.createElement('p');
                            num.innerText = ${ticket.place};
                            place.appendChild(num);
                            row.appendChild(place);
                        }
                    </#list>
                    modalb.appendChild(hall);
                </#list>
            </#if>
        </#list>

        function showrow() {
            var counter = ((((this.parentNode).parentNode).parentNode).parentNode).getElementsByClassName('count_b')[0];
            var cost = ((((this.parentNode).parentNode).parentNode).parentNode).getElementsByClassName('cost')[0];
            if(this.classList.contains('booked'))
                return;
            if(this.classList.contains('selected')){
                counter.innerText = parseInt(counter.innerText) - 1;
                cost.innerText = parseInt(cost.innerText) - 300
            } else {
                counter.innerText = parseInt(counter.innerText) + 1;
                cost.innerText = parseInt(cost.innerText) + 300
            }
            $(this).toggleClass('selected');
        }
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
                            <#list genres as genre>
                                <#if genre_has_next><p>${genre},</p><#else><p>${genre}.</p></#if>
                            </#list>
                        </div>
                        <div>
                            <h5><b>В прокате с</b></h5>
                            <h5><b>${film.dateRelease}</b></h5>
                        </div>
                        <div>
                            <p><b>Ограничение по возрасту:</b></p>
                            <p><b>${film.rars}+</b></p>
                        </div>
                        <div>
                            <p><b>Производство: </b></p>
                            <#list countries as country>
                                <#if country_has_next><p>${country},</p><#else><p>${country}.</p></#if>
                            </#list>
                        </div>
                        <div>
                            <p><b>Режиссер:</b></p>
                            <#list directors as director>
                                <#if director_has_next><p>${director},</p><#else><p>${director}.</p></#if>
                            </#list>
                        </div>
                        <div>
                            <p><b>Продюссер:</b></p>
                            <#list producers as producer>
                                <#if producer_has_next><p>${producer},</p><#else><p>${producer}.</p></#if>
                            </#list>
                        </div>
                        <div>
                            <p><b>Сценарист:</b></p>
                            <#list screenwriters as screenwriter>
                                <#if screenwriter_has_next><p>${screenwriter},</p><#else><p>${screenwriter}.</p></#if>
                            </#list>
                        </div>
                        <div>
                            <p><b>Продолжительность:</b></p>
                            <p>${film.duration} мин</p>
                        </div>
                        <div class="roles">
                            <p><b>В ролях:</b></p>
                            <#list actors as actor>
                                <#if actor_has_next><p>${actor},</p><#else><p>${actor}.</p></#if>
                            </#list>
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
                            <#list genres as genre>
                                <#if genre_has_next><p>${genre},</p><#else><p>${genre}.</p></#if>
                            </#list>
                    </div>
                    <div>
                        <h5><b>В прокате с</b></h5>
                        <h5><b>${film.dateRelease}</b></h5>
                    </div>
                    <div>
                        <p><b>Ограничение по возрасту:</b></p>
                        <p><b>${film.rars}+</b></p>
                    </div>
                    <div>
                        <p><b>Производство: </b></p>
                            <#list countries as country>
                                <#if country_has_next><p>${country},</p><#else><p>${country}.</p></#if>
                            </#list>
                    </div>
                    <div>
                        <p><b>Режиссер:</b></p>
                            <#list directors as director>
                                <#if director_has_next><p>${director},</p><#else><p>${director}.</p></#if>
                            </#list>
                    </div>
                    <div>
                        <p><b>Продюссер:</b></p>
                            <#list producers as producer>
                                <#if producer_has_next><p>${producer},</p><#else><p>${producer}.</p></#if>
                            </#list>
                    </div>
                    <div>
                        <p><b>Сценарист:</b></p>
                            <#list screenwriters as screenwriter>
                                <#if screenwriter_has_next><p>${screenwriter},</p><#else><p>${screenwriter}.</p></#if>
                            </#list>
                    </div>
                    <div>
                        <p><b>Продолжительность:</b></p>
                        <p>${film.duration} мин</p>
                    </div>
                    <div class="roles">
                        <p><b>В ролях:</b></p>
                            <#list actors as actor>
                                <#if actor_has_next><p>${actor},</p><#else><p>${actor}.</p></#if>
                            </#list>
                    </div>
                    <div class="text">
                        <p>${film.description}</p>
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
                <#if sessions[0][0]??>
                    <h2>Расписание сеансов</h2>
                    <div class="list-structure">
                    <ul class="dropdown_main">
                    <#list sessions as session>
                        <#if session[0]??>
                            <li class="dropdown_shedule">
                            <p class="dropdown_title" href="#">${session[0][0].sessionDate}</p>
                            <ul class="dropdown">
                            <#list session as ses>
                                <li>
                                <a class="line_li_a" href="#">${ses[0].sessionTime}</a>
                                <a class="line_li_a" href="#">${ses[1].name}</a>
                                <a class="line_li_a" href="#">${ses[2].name}</a>
                                <#if signedIn??>
                                    <#if signedIn == true><button type="button" class="btn btn-primary line_li_a" data-toggle="modal" data-target="#buyticket${ses[0].id}">купить</button></#if>
                                </#if>
                                </li>
                            </#list>
                            </ul>
                            </li>
                        </#if>
                    </#list>
                    </ul>
                    </div>
                <#else><h2>Сеансов нет</h2></#if>
                </div>
                <div class="col-2"></div>
            </div>

            <#list reviews as review>
                <div class="Review container">
                    <div class="Review-details">
                        <div class="Review-meta">
                            <p class="Review-author">${review[1]}</p>
                            <p class="Review-date">${review[0].publicationDate}</p>
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
                        <p>${review[0].reviewText}</p>
                    </div>
                </div>
            </#list>
            <#if signedIn??>
                <#if signedIn == true>
                        <div class="container">
                            <form id="review-form" action="/leaveReview/${film.id}" method="post">
                                <h2>Оставьте отзыв</h2>
                                <div id="rating">
                                    <svg class="star" id="1" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve"
                             style="fill: #f39c12;">
                                  <polygon
                                          points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                                </svg>
                        <svg class="star" id="2" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve"
                             style="fill: #f39c12;">
                                  <polygon
                                          points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                                </svg>
                        <svg class="star" id="3" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve"
                             style="fill: #f39c12;">
                                  <polygon
                                          points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                                </svg>
                        <svg class="star" id="4" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve"
                             style="fill: #f39c12;">
                                  <polygon
                                          points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                                </svg>
                        <svg class="star" id="5" viewBox="0 12.705 512 486.59" x="0px" y="0px" xml:space="preserve"
                             style="fill: #808080;">
                                  <polygon
                                          points="256.814,12.705 317.205,198.566 512.631,198.566 354.529,313.435 414.918,499.295 256.814,384.427 98.713,499.295 159.102,313.435 1,198.566 196.426,198.566"></polygon>
                                </svg>
                                </div>
                                <span id="starsInfo" class="help-block">
                                Поставьте оценку
                              </span>
                                <div class="form-group">
                                    <label class="control-label" for="review">Ваш отзыв:</label>
                                    <textarea type="text" class="form-control" rows="10" placeholder="Отзыв" name="review"
                                              id="review"></textarea>
                                    <span id="reviewInfo" class="help-block pull-right">
                                  <span id="remaining">999</span> Символов осталось
                                </span>
                                </div>
                                <input class="btn btn-primary" id="submitForm" type="submit" value="Сохранить">
                                <span id="submitInfo" class="help-block">
                                Нажимая <strong>Сохранить</strong>, Я соглашаюсь с политикой конфиденциальности.
                              </span>
                            </form>
                        </div>
                </#if>
                </#if>


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
        <!-- Modal -->
        <#list sessions as session>
            <#if sessions[0]??>
                <#list session as ses>
                <div class="modal fade" id="buyticket${ses[0].id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Купить билет</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="buy_ticket">
                            <div id="modalbody${ses[0].id}" class="modal-body"></div>
                                <div style="text-align: center">
                                    <div style="display: inline-block; width: 100%">
                                        <p style="display: inline-block"><b>Кинотеатр, зал  </b></p>
                                        <p style="display: inline-block">${ses[1].name} </p>
                                        <p style="display: inline-block"> ${ses[2].name} </p>
                                    </div>
                                    <div style="display: inline-block; width: 100%">
                                        <p style="display: inline-block"><b>Дата, время  </b></p>
                                        <p style="display: inline-block">${ses[0].sessionDate} </p>
                                        <p style="display: inline-block">${ses[0].sessionTime} </p>
                                    </div>
                                    <div style="display: inline-block; width: 100%">
                                        <p><b>Ограничение по возрасту</b></p>
                                        <p>Для детей старше 12 лет</p>
                                    </div>
                                    <div style="display: inline-block; width: 100%">
                                        <p style="display: inline-block"><b>Выбрано </b></p>
                                        <p style="display: inline-block" class="count_b">0</p>
                                        <p style="display: inline-block" class="count_name"> бил </p>
                                        <p style="display: inline-block" class="cost">0</p>
                                        <p style="display: inline-block"> руб</p>
                                    </div>
                                </div>
                            <div class="modal-footer">
                                <button type="submit" onclick="order()" class="btn btn-primary" data-dismiss="modal">Продолжить</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                </#list>
            </#if>
        </#list>
    </div>
    <@auth.auth></@auth.auth>
</@common.page>