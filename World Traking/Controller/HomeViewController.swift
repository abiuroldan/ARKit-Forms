//
//  HomeViewController.swift
//  World Traking
//
//  Created by Abiú Roldán on 3/23/19.
//  Copyright © 2019 Abiú Roldán. All rights reserved.
//

import UIKit
import ARKit

class HomeViewController: UIViewController {
    
    let rootView = HomeRootView()
    let configuration = ARWorldTrackingConfiguration()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupARKitScene()
        setupTarges()
    }
    
    func setupARKitScene() {
        rootView.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        rootView.sceneView.session.run(configuration)
        //Enables the reflection to the object
        rootView.sceneView.autoenablesDefaultLighting = true
    }
    
    func setupTarges() {
        rootView.addButton.addTarget(self, action: #selector(addNodes), for: .touchUpInside)
        rootView.resetButton.addTarget(self, action: #selector(resetAction), for: .touchUpInside)
    }
    
    @objc func addNodes() {
        //Create the node object
        let node = SCNNode()
        
        //cylinderNode
//        let cylinderNode = SCNNode()
        
        //boxBode
        let boxNode = SCNNode()
        
        //DoorNode
        let doorNode = SCNNode()
        
        //Pryramid form
        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        
        //Plane form
//        node.geometry = SCNPlane(width: 0.2, height: 0.2)
        doorNode.geometry = SCNPlane(width: 0.03, height: 0.06)
        
        //Torus form
//        node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
        
        //Tube form
//        node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.2, height: 0.3)
        
        //Sphere form
//        node.geometry = SCNSphere(radius: 0.2)
        
        //Cylinder form
//        node.geometry = SCNCylinder(radius: 0.2, height: 0.2)
//        cylinderNode.geometry = SCNCylinder(radius: 0.2, height: 0.2)
        
        //Cone form
//        node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.3, height: 0.3)
        
        //Capsule form
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
        
        // Gives the form, this is a Box
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        boxNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        /*let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
        path.addLine(to: CGPoint(x: 0.4, y: 0))
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        node.geometry = shape*/
        
        //This is what is reflected from the object #CoolStuff
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
//        cylinderNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        //Gives the color
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
//        cylinderNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        
        //Ramdon number
//        let x = randomNumber(-0.03, 0.03)
//        let y = randomNumber(-0.03, 0.03)
//        let z = randomNumber(-0.03, 0.03)
        
        //Specifies the position of the note
        node.position = SCNVector3(0.2, 0.2, -0.2)
//        cylinderNode.position = SCNVector3(-0.3, 0.2, -0.3)
        boxNode.position = SCNVector3(0, -0.05, 0)
        doorNode.position = SCNVector3(0, -0.2, 0.055)
        
        // Add the node as child
        rootView.sceneView.scene.rootNode.addChildNode(node)
        //Add cylinderNode as child to set the position relative to the node
//        node.addChildNode(cylinderNode)
        node.addChildNode(boxNode)
        boxNode.addChildNode(doorNode)
    }
    
    @objc func resetAction() {
        rootView.sceneView.session.pause()
        rootView.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        
        rootView.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    //Give to the object a random position
    func randomNumber(_ firstNum: CGFloat, _ secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}
