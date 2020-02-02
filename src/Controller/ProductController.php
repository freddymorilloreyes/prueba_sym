<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductFilterType;
use App\Form\ProductType;
use App\Repository\ProductRepository;
use App\Service\Product\ProductCreator;
use App\Service\Product\ProductRemover;
use App\Service\Product\ProductUpdater;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class ProductController
 * @package App\Controller
 * @Route("/product")
 */
class ProductController extends AbstractController
{
    /**
     * @Route("/list/{page}", name="product")
     * @param Request $request
     * @param ProductRepository $productRepository
     * @param PaginatorInterface $paginator
     * @param int $page
     * @return Response
     */
    public function index(Request $request, ProductRepository $productRepository,PaginatorInterface $paginator, int $page=1)
    {
        $data = count($request->request->all())?$request->request->all()["product_filter"]:[];

        $form = $this->createForm(ProductFilterType::class,$data);

        $pagination = $paginator->paginate(
            $productRepository->findByFilters($data),
            $page,
            10
        );

        return $this->render('product/index.html.twig', [
            'form' => $form->createView(),
            'products' => $pagination,
        ]);
    }

    /**
     * @Route("/new", name="product_new")
     * @param Request $request
     * @param ProductCreator $productCreator
     * @return RedirectResponse|Response
     */
    public function new(Request $request, ProductCreator $productCreator)
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class,$product);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $productCreator->create($product);
            $this->addFlash('notice','Producto Creado con Éxito!');
            return $this->redirectToRoute('product');
        }
        return $this->render('product/new.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/edit", name="product_edit")
     * @param Product $product
     * @param Request $request
     * @param ProductUpdater $productUpdater
     * @return RedirectResponse|Response
     */
    public function edit(Product $product, Request $request, ProductUpdater $productUpdater)
    {
        $form = $this->createForm(ProductType::class, $product);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $productUpdater->update($product);
            $this->addFlash('notice', 'Producto actualizado!');
            return $this->redirectToRoute('product');
        }
        return $this->render('product/edit.html.twig', [
           'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/remove", name="product_remove")
     * @param Product $product
     * @param ProductRemover $productRemover
     * @return RedirectResponse
     */
    public function remove(Product $product, ProductRemover $productRemover)
    {
        $productRemover->destroy($product);
        $this->addFlash('notice', 'Producto Eliminado!');
        return $this->redirectToRoute('product');
    }
}
