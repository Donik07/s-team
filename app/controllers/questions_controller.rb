class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new question_params
        if @question.save
            flash[:success] = "Заявка создана!"
            redirect_to questions_path
        else
            render :new
        end
    end

    def edit
        @question = Question.find_by id: params[:id]
    end

    def update
        @question = Question.find_by id: params[:id]
        if @question.update question_params
            flash[:success] = "Заявка обновлена!"
            redirect_to questions_path
        else
            render :edit
        end
    end

    def destroy
        @question = Question.find_by id: params[:id]
        @question.destroy
        if @question.destroy
            flash[:danger] = "Ваша заявка была удалена!"
            redirect_to questions_path
        end
    end

    def show
        @question = Question.find_by id: params[:id]
    end

    private def question_params
        params.require(:question).permit(:title, :body)
    end

    def get_days arg
        arg.to_i.div(1.day) !=0 ? "#{arg.div(1.day)} day(s)" : 'Сегодня'
    end
    helper_method :get_days
 
end
