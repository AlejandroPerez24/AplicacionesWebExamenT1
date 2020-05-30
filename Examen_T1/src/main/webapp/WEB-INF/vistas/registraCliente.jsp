<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Cliente</title>
</head>
<body>

<div class="container">
<h1>Registra Cliente</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraCliente" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nom_cliente" placeholder="Ingrese el Nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellidos">Apellidos</label>
				<input class="form-control" id="id_apellidos" name="ape_cliente" placeholder="Ingrese el Apellido" type="text">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dni">DNI</label>
				<input class="form-control" id="id_dni" name="dni_cliente" placeholder="Ingrese el número de DNI" type="text" maxlength="8"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaNacimiento">Fecha de Nacimiento</label>
				<input class="form-control" id="id_fechaNacimiento" name="fec_nac_cliente" placeholder="Ingrese la Fecha de Nacimiento" type="date"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_tipo">Tipo</label>
				<select id="id_tipo" name="tipo.cod_tipo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Registrar Cliente</button>
			</div>
	</form>
</div>

<script type="text/javascript">
console.log("inicio");
$.getJSON("cargaTipo", {}, function(data){
	console.log("inicio2");
	$.each(data, function(index,item){
		$("#id_tipo").append("<option value="+item.cod_tipo +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nom_cliente: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        ape_cliente: {
    		selector : '#id_apellidos',
            validators: {
                notEmpty: {
                    message: 'El Apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'El Apellido es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        dni_cliente: {
    		selector : '#id_dni',
            validators: {
            	notEmpty: {
                    message: 'El DNI es un campo obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{8}$/,
                    message: 'El DNI tiene 8 dígitos
                    }
            }
        },
        fec_nac_cliente: {
    		selector : '#id_fechaNacimiento',
            validators: {
            	notEmpty: {
                    message: 'La fecha de Nacimiento es un campo obligatorio'
                },
                date: {
                    format: 'DD/MM/YYYY',
                    message: 'La fecha de Nacimiento es de formato DD/MM/YYYY'
                   }
            }
        },
    
        tipo: {
    		selector : '#id_tipo',
            validators: {
            	notEmpty: {
                    message: 'El Tipo un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




