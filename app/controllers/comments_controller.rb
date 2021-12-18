# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: %i[edit update destroy]
  before_action :find_expert, only: %i[new]
  before_action :correct_user, only: %i[new create edit update destroy]

  def new
    @comment = current_user.comments.build(expert: @expert)
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to expert_path(@comment.expert), success: 'Комментарий добавлен'
    else
      flash.now[:error] = 'Комментарий не добавлен'
      render 'new'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.expert, success: 'Комментарий изменён'
    else
      flash.now[:error] = 'Комментарий не изменён'
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.expert, success: 'Комментарий удалён'
  end

  private

  def find_expert
    @expert = Expert.find(params[:expert_id])
  end

  def find_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :rating, :recommendation, :expert_id)
  end
end
