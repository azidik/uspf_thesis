<!-- page 11 -->
                        <div class="tab-pane" id="page11">
                            <h3 style="color: red">11. Family Background</h3>

                            <br>
                            <h6 style="font-weight: bold; background-color: #06b0c5;">Spouse</h6>
                            <div class="row">
                            	<div class="col-md-6">
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.1 Spouse's Name</label>
		                                <input type="" class="form-control">
		                            </div>
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.2 Educational Attainment</label>
		                                <input type="" class="form-control">
		                            </div>
                            	</div>
                            	<div class="col-md-6">
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.3 Occupation</label>
		                                <input type="" class="form-control">
		                            </div>
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.4 Ave. Monthly Income</label>
		                                <input type="" class="form-control">
		                            </div>
                            	</div>
                            </div>
                            <br>
                            <h6 style="font-weight: bold; background-color: #06b0c5;">Father</h6>
                            <div class="row">
                            	<div class="col-md-6">
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.5 Father's Name</label>
		                                <input type="" class="form-control">
		                            </div>
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.6 Educational Attainment</label>
		                                <input type="" class="form-control">
		                            </div>
                            	</div>
                            	<div class="col-md-6">
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.7 Occupation</label>
		                                <input type="" class="form-control">
		                            </div>
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.8 Ave. Monthly Income</label>
		                                <input type="" class="form-control">
		                            </div>
                            	</div>
                            </div>
                            <br>
                            <h6 style="font-weight: bold; background-color: #06b0c5;">Mother</h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">11.9 Mother's Name</label>
                                        <input type="" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="bmd-label-floating">11.10 Educational Attainment</label>
                                        <input type="" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">11.11 Occupation</label>
                                        <input type="" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="bmd-label-floating">11.12 Ave. Monthly Income</label>
                                        <input type="" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <h6 style="font-weight: bold; background-color: #06b0c5;" >Guardian</h6>
                            <div class="row">
                            	<div class="col-md-6">
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.13 Name of Guardian</label>
		                                <input type="" class="form-control">
		                            </div>
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.14 Educational Attainment</label>
		                                <input type="" class="form-control">
		                            </div>
                            	</div>
                            	<div class="col-md-6">
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.15 Occupation</label>
		                                <input type="" class="form-control">
		                            </div>
                            		<div class="form-group">
		                                <label class="bmd-label-floating">11.16 Ave. Monthly Income</label>
		                                <input type="" class="form-control">
		                            </div>
                            	</div>
                            </div>
                            <br>
                            <hr>
                            <button id="btn-add" type="button" class="btn btn-primary pull-right">
                                <i class="material-icons">add_circle_outline</i>
                                    Add row
                            </button>
                            <div class="card-content table-responsive">
                                <table id="dependent-table" class="table table-hover">
                                    <col width="60%">
                                    <col width="20%">
                                    <col width="20%">
                                        <thead>
                                           <tr>
                                               <th><h6 style="font-weight: bold;">11.17 Dependents</h6></th>
                                               <th><h6 style="font-weight: bold;">11.18 Age</h6></th>
                                               <th><h6 style="font-weight: bold;">Action</h6></th>
                                           </tr>
                                        </thead>
                                        <tbody id='body'>
                                            <tr id="row0">
                                                <td>
                                                    <input class="form-control" type="text" name="dependents0" placeholder="Dependent">
                                                </td>
                                                <td>
                                                    <input class="form-control" type="number" name="age0" placeholder="Age">
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-sm btn-delete">
                                                        <i class="material-icons">delete</i>
                                                            Delete row
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr id="row1"></tr>
                                        </tbody>
                                </table>
                            </div>
                        </div>