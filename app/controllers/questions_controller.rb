class QuestionsController < ApplicationController
    before_action :get_question!, only: %i[show destroy edit update]
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

    end

    def update
        if @question.update question_params
            flash[:success] = "Заявка обновлена!"
            redirect_to questions_path
        else
            render :edit
        end
    end

    def destroy
        @question.destroy
        if @question.destroy
            flash[:danger] = "Ваша заявка была удалена!"
            redirect_to questions_path
        end
    end

    def show
        @answer = @question.answers.build
        @answers = @question.answers.all
    end

    def get_days arg
        time = arg
        now = DateTime.now.strftime('%d/%m %H:%M')
        res = now.to_i - time.to_i

        if res == 0
            'Сегодня'
        elsif res == 1
            'Вчера'
        else
            res.to_s + ' дн.'
        end
    end
    helper_method :get_days

    private

    def question_params
        params.require(:question).permit(:title, :body)
    end

    def get_question!
        @question = Question.find params[:id]
    end
 
end
