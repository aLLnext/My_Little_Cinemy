<#import "parts/common.ftl" as common>
<#assign links>
    <link rel="stylesheet" type="text/css" href="../css/cinemas_style.css">
</#assign>
<@common.page links=links>
    <div class="main">
        <div class="container-fluid"">
            <div class="offset-sm-3 row">
                <div class="col-sm-2">
                    <a class="nav-link" href="#" style="font-family: Montserrat;">Сеансы</a>
                </div>
                <div class="col-sm-2">
                    <a class="nav-link" href="#">Сегодня</a>
                </div>
                <div class="col-sm-2">
                    <a class="nav-link" href="#">Завтра</a>
                </div>
            </div>
        </div>
            <div class="row">
                <div class="col-md-8 offset-md-2 offset-sm-2">
                    <div class="row m-2 p-1 custom-card">
                        <div class="col-md-4 pt-1">
                            <img class="img-thumbnail" src="../img/">
                            <h5>Cinema Name</h5>
                        </div>
                        <div class="col-md-8 ">
                            <p>phone and email </p>
                            <p>lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem orem ipsum lorem ipsum
                                lorem ipsum lorem ipsum lorem ipsum lorem lorem ipsum lorem ipsum lorem ipsum lorem
                                ipsum lorem ipsum lorem orem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem
                                lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ip</p>
                        </div>
                    </div>
                    <div class="row m-2 p-1 custom-card">
                        <div class="col-md-12 text-center">
                            Film Name
                            <small>12+</small>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <img class="img-thumbnail" src="test2.jpg" style="object-fit: cover;">
                            </div>
                            <div class="col-md-8 ">
                                <div class="row col-12">
                                    <div class="row col-12">
                                        <p>2D</p>
                                    </div>
                                    <div class="row col-12">
                                        <button type="button" class="btn btn-outline-primary btn-sm">Primary</button>
                                    </div>
                                </div>

                                <div class="row col-12 pt-3">
                                    <div class="row col-12">
                                        <p>2D</p>
                                    </div>
                                    <div class="row col-12">
                                        <button type="button" class="btn btn-outline-primary btn-sm">Primary</button>
                                        <button type="button" class="btn btn-outline-primary btn-sm ml-2">Primary
                                        </button>
                                        <button type="button" class="btn btn-outline-primary btn-sm ml-2">Primary
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row m-2 p-1 custom-card">
                        <div class="col-md-12 text-center">
                            Film Name
                            <small>12+</small>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <img class="img-thumbnail" src="test2.jpg" style="object-fit: cover;">
                            </div>
                            <div class="col-md-8 ">
                                <div class="row col-12">
                                    <div class="row col-12">
                                        <p>2D</p>
                                    </div>
                                    <div class="row col-12">
                                        <button type="button" class="btn btn-outline-primary btn-sm">Primary</button>
                                    </div>
                                </div>

                                <div class="row col-12 pt-3">
                                    <div class="row col-12">
                                        <p>2D</p>
                                    </div>
                                    <div class="row col-12">
                                        <button type="button" class="btn btn-outline-primary btn-sm">Primary</button>
                                        <button type="button" class="btn btn-outline-primary btn-sm ml-2">Primary
                                        </button>
                                        <button type="button" class="btn btn-outline-primary btn-sm ml-2">Primary
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
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

</@common.page>