$(document).ready(function(){
	let i = 1;

	$('')
	//family background table
	$("#btn-add").on("click", function(event){
		let tr="<td><input class='form-control' name='dependent"+i+"' type='text' placeholder='Dependent'/></td><td><input class='form-control' name='age"+i+"' type='number' placeholder='Age'/></td><td><button type='button' class='btn btn-danger btn-sm btn-delete pull-right'><i class='material-icons'>delete</i>Delete row</button></td>";

		$('#body').append('<tr id="row'+(i+1)+'">'+tr+'</tr>');
		i++;
	});

	$('#dependent-table').on("click", ".btn-delete", function(event){
		$(this).closest("tr").remove();
		i -= 1;
	});
	//competency assessment table

	$("#cap-btn-add").on("click", function(event){
		let td="<td><input class='form-control' name='is"+i+"' type='text'/></td><td><input class='form-control' name='ta"+i+"' type='number'/></td><td><input class='form-control' name='occ"+i+"' type='text'/></td><td><input class='form-control' name='class"+i+"' type='text'/></td><td><input class='form-control' name='com"+i+"' type='text'/></td><td><input class='form-control' name='sd"+i+"' type='text'/></td><td><button type='button' class='btn btn-danger btn-sm btn-delete pull-right'><i class='material-icons'>delete</i>Delete row</button></td>";

		$('#cap-body').append('<tr id="row'+(i+1)+'">'+td+'</tr>');
		i++;
	});

	$('#cap-table').on("click", ".btn-delete", function(event){
		$(this).closest("tr").remove();
		i -= 1;
	});

	//educational background table

	$("#eb-btn-add").on("click", function(event){
		let td="<td><input class='form-control' name='sc"+i+"' type='text'/></td><td><input class='form-control' name='el"+i+"' type='number'/></td><td><input class='form-control' name='sy-s"+i+"' type='text'/></td><td><input class='form-control' name='sy-e"+i+"' type='text'/></td><td><input class='form-control' name='deg"+i+"' type='text'/></td><td><input class='form-control' name='min"+i+"' type='text'/></td><td><input class='form-control' name='maj"+i+"' type='text'/></td><td><input class='form-control' name='ue"+i+"' type='text'/></td><td><input class='form-control' name='hr"+i+"' type='text'/></td><td><button type='button' class='btn btn-danger btn-sm btn-delete pull-right'><i class='material-icons'>delete</i>Delete row</button></td>";

		$('#eb-body').append('<tr id="row'+(i+1)+'">'+td+'</tr>');
		i++;
	});

	$('#eb-table').on("click", ".btn-delete", function(event){
		$(this).closest("tr").remove();
		i -= 1;
	});

});