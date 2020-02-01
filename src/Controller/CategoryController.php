<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use App\Service\Category\CategoryCreator;
use App\Service\Category\CategoryRemover;
use App\Service\Category\CategoryUpdater;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class CategoryController
 * @package App\Controller
 * @Route("/category")
 */
class CategoryController extends AbstractController
{
    /**
     * @Route("/", name="category")
     * @param CategoryRepository $categoryRepository
     * @return Response
     */
    public function index(CategoryRepository $categoryRepository)
    {
        return $this->render('category/index.html.twig', [
            'categories' => $categoryRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="category_new")
     * @param Request $request
     * @param CategoryCreator $categoryCreator
     * @return Response
     */
    public function new(Request $request, CategoryCreator $categoryCreator)
    {
        $category = new Category();

        $form = $this->createForm(CategoryType::class, $category);

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $categoryCreator->create($category);
            $this->addFlash('notice', 'Categoría Creada con Éxito');
            return $this->redirectToRoute('category');
        }
        return $this->render('category/new.html.twig',[
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/edit", name="category_edit")
     * @param Category $category
     * @param Request $request
     * @param CategoryUpdater $categoryUpdater
     * @return Response
     */
    public function edit(Category $category, Request $request, CategoryUpdater $categoryUpdater)
    {
        $form = $this->createForm(CategoryType::class,$category);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $categoryUpdater->update($category);
            $this->addFlash('notice','Categoría Actualizada con Éxito!');
            return $this->redirectToRoute('category');
        }

        return $this->render('category/edit.html.twig',[
            'form' => $form->createView(),
        ]);

    }

    /**
     * @Route("/{id}/remove", name="category_remove")
     * @param Category $category
     * @param CategoryRemover $categoryRemover
     * @return RedirectResponse
     */
    public function remove(Category $category, CategoryRemover $categoryRemover)
    {
        $categoryRemover->destroy($category);
        $this->addFlash('notice', 'Categoría Removida Con Éxito');
        return $this->redirectToRoute('category');
    }

}
