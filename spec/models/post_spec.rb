# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    post = Post.new(title: 'Título de prueba', content: 'Contenido de prueba')
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(title: nil, content: 'Contenido de prueba')
    expect(post).to_not be_valid
  end

  it 'is not valid without content' do
    post = Post.new(title: 'Título de prueba', content: nil)
    expect(post).to_not be_valid
  end
end
