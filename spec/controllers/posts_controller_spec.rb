# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:valid_attributes) { { title: 'Título de prueba', content: 'Contenido de prueba' } }

  context 'validations' do
    it 'is valid with valid attributes' do
      post = Post.new(valid_attributes)
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

    # Ejemplo de validación de longitud
    it 'is not valid if the title is too short' do
      post = Post.new(title: 'a', content: 'Contenido de prueba')
      expect(post).to_not be_valid
    end

    # Si hay una validación de unicidad, prueba lo siguiente
    it 'is not valid with a duplicate title' do
      Post.create!(valid_attributes)
      post = Post.new(title: 'Título de prueba', content: 'Otro contenido')
      expect(post).to_not be_valid
    end
  end
end
