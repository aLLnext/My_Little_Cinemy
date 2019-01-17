<#import "parts/common.ftl" as common>
<#assign links>
    <link rel="stylesheet" type="text/css" href="../css/cinemas_style.css">
</#assign>

<@common.page links=links>
<div class="main">
    <#list cinemas as cinema>
    <div class="container-fluid text-center">
        <div class="row content">
            <div class="offset-sm-2 col-sm-8 text-left">
                <div onclick="location.href='cinemas/${cinema.id}'" style="cursor: pointer;" class="jumbotron jumbotron-fluid about_cinema">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-4">
                                    <img class="img-thumbnail" style="width: 300px; height: 150px" src="${cinema.icon}">
                                </div>
                                <div class="col-sm-8">
                                    <h1 class="display-4">${cinema.name}</h1>
                                    <p class="lead">${cinema.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    </#list>

    <footer class="container-fluid text-center">
        <div class="jumbotron jumbotron-fluid about_cinema">
            <div class="container">
                <p class="text-center">Вы являетесь представителем кинотетра или продаете билеты? Напишите нам pochta@ourcinema.ru</p class="text-center">
                <a href="#">Хочу стать билетером</a>
            </div>
        </div>
    </footer>

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
</@common.page>