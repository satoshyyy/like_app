class PostsController < ApplicationController

  # ***** 以下を追加 *****
  before_action :set_post, only: %i[edit update destroy]
  # ***** 以上を追加 *****

  def index
    # ***** 以下を追加 *****
    @posts = Post.order(:created_at)
    # ***** 以上を追加 *****
  end

  def new
    # ***** 以下を編集 *****
    @post = Post.new
    # ***** 以上を編集 *****
  end

  def create
    # ***** 以下を編集 *****
    post = current_user.posts.create!(post_params)
    redirect_to post
    # ***** 以上を編集 *****
  end

  def show
    # ***** 次を追加 *****
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update

    # ***** 以下を編集 *****
    @post.update!(post_params)
    redirect_to @post
    # ***** 以上を編集 *****
  end

  def destroy
    # ***** 以下を編集 *****
    @post.destroy!
    redirect_to root_path
    # ***** 以上を編集 *****
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  # ***** 以下を追加 *****
  def set_post
    # 「自分の投稿」の中から URL の :id に対応する投稿を探す
    # 「他人の投稿」の場合はエラーを出す
    @post = current_user.posts.find(params[:id])
  end

  # ***** 以上を追加 *****

end
