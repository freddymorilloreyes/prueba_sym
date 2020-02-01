<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Product;
use App\Repository\CategoryRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('code', TextType::class,[
                'label' => 'Código',
            ])
            ->add('name', TextType::class, [
                'label' => 'Nombre',
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Descripción',
            ])
            ->add('brand', TextType::class, [
                'label' => 'Marca',
            ])
            ->add('price', NumberType::class, [
                'label' => 'Precio',
            ])
            ->add('category', EntityType::class, [
                'class' => Category::class,
                'query_builder' => function(CategoryRepository $categoryRepository){
                    return $categoryRepository->createQueryBuilder('c')
                        ->where('c.active = 1');
                },
                'label' => 'Categoría',
                'choice_label' => 'name',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
        ]);
    }
}
