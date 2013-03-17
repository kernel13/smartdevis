class EmployeeTasksController < ApplicationController

	# DELETE /employee_tasks/1
   # DELETE /employee_taks/1.json
   def destroy
         @employee_task = EmployeeTask.find(params[:id])
         @employee_task.destroy
     
         respond_to do |format|
           format.html { redirect_to :back }
           format.json { head :no_content }
         end
       end
end