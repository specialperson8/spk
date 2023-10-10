<?php
require("controller/Login.php");

session_start();

if (isset($_SESSION['login'])) {
    header("Location: page/index.php");
    exit;
}

if (isset($_POST['login'])) {
    $login = Login($_POST);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="asset/css/bulma.min.css">
    <link rel="stylesheet" href="asset/css/animate.min.css">
    <link rel="stylesheet" href="asset/css/costume.css">
    <link rel="stylesheet" href="asset/css/datatables.css">
    <link rel="stylesheet" href="asset/css/datatables.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.1/css/bulma.min.css"></script>
    <script src="https://cdn.datatables.net/1.13.6/css/dataTables.bulma.min.css"></script>
</head>

<body>
    <section class="hero is-medium is-primary is-bold">
        <div class="hero-body">
            <div class="container">
                <h1 class="title animate__animated animate__zoomIn">
                    MIPEEW (ADMIN PERHITUNGAN WEIGHTED PRODUCT)
                </h1>
                <h2 class="subtitle animate__animated animate__slideInUp">
                    By Ferdi Andriansyah | Lya Nurul Ula | Dina Dwi Arika
                </h2>
            </div>
        </div>
    </section>
    <section class="section" id="section">
        <div class="container">
            <div class="row">
                <div class="columns is-centered">
                    <div class="column is-5">
                        <div class="card">
                            <div class="card-header">
                                <p class="card-header-title">Login</p>
                            </div>
                            <div class="card-content">
                                <?php if (isset($login['error'])) : ?>
                                <p>
                                    <?= "<script>
        Swal.fire({
            icon: 'error',
            title: 'Gagal',
            text: 'Gagal login, periksa kembali username dan password anda!',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        }).then(function() {
            window.location.href = 'index.php';
        });
        </script>"; ?></p>
                                <?php endif ?>
                                <form action="" method="post">
                                    <div class="field">
                                        <label class="label">Username</label>
                                        <div class="control has-icons-left">
                                            <input class="input" type="text" placeholder="Username" name="username"
                                                required autocomplete="off" autofocus>
                                            <span class="icon is-small is-left">
                                                <ion-icon name="person"></ion-icon>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <label class="label">Password</label>
                                        <div class="control has-icons-left">
                                            <input class="input" type="password" placeholder="Password" name="password"
                                                required autocomplete="off">
                                            <span class="icon is-small is-left">
                                                <ion-icon name="lock-closed"></ion-icon>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="buttons">
                                        <button class="button is-link" type="submit" name="login">
                                            <ion-icon name="log-in" class="mr-2"></ion-icon>Login
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bulma.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="asset/js/datatables.js"></script>
    <script src="asset/js/datatables.min.js"></script>
    <script src="asset/js/jquery.dataTables.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#tabeldata').dataTable();
    });
    </script>
</body>

</html>